require 'winforms'

include System::Collections
include System::Drawing::Drawing2D
include System::IO
include System::Net

class RssItem
  attr_reader :attributes
  attr_writer :attributes

  def members
    ['title', 'link', 'description']
  end

  # todo: some method_missing magic here
  def title
    @attributes['title']
  end

  def link
    @attributes['link']
  end

  def description
    @attributes['description']
  end

  def url
    @attributes['url']
  end
end

class RssFeed < RssItem
  attr_reader :items

  def image
    @image == nil ? nil : @image.url
  end
  
  def read_item(r, name)
    end_found = false
    item = RssItem.new
    while !end_found and r.Read
      if r.NodeType == XmlNodeType::EndElement and r.LocalName.downcase == name
        end_found = true
      elsif r.NodeType == XmlNodeType::Element
        item.attributes ||= {}
        item.attributes[r.LocalName] = r.ReadString
      end
    end
    item
  end    

  def initialize(path)
    auto_close(XmlTextReader.new(path)) do |r|
      @items = []
      found_channel = false
      while r.read
        local_name = r.LocalName.downcase
        if r.node_type == XmlNodeType::Element
          if !found_channel
            found_channel = true if local_name == 'channel'
          elsif local_name == 'item'
            @items << read_item(r, 'item')
          elsif local_name == 'image'
            @image = read_item(r, 'image')
          else
            if r.MoveToContent == XmlNodeType::Element
              content = r.ReadString
              if r.NodeType == XmlNodeType::EndElement
                @attributes ||= {}
                @attributes[r.LocalName] = content
              end
            end
          end
        end
      end
    end
  end
end

RssFeedUrl = Struct.new(:name, :link)

class RssLinks
  def self.load(path)
    a = []
    auto_dispose(StreamReader.new(FileStream.new(path, FileMode::Open))) do |r|
      a << RssFeedUrl.new(*r.ReadLine.split(',')) until r.EndOfStream
    end
    a.to_data_table
  end
end

class BrowserView
  attr_reader :form

  def initialize(url)
    form      = Form.new
    form.Size = Size.new(800, 800)
    form.Text = 'Browser view!'

    browser      = WebBrowser.new
    browser.Dock = DockStyle::Fill
    browser.Url  = Uri.new(url)
    browser.Navigated do |sender, args|
      # when ToString is missing the error message is bizarre - really need to
      # clean up error messages form.Text = browser.Url.ToString
      form.Text = browser.DocumentTitle
    end

    form.Controls.Add(browser)
    @form = form
  end
end

class RssView
  attr_reader :control

  def bind_to(data_source)
    @data_source = data_source
    @grid.DataSource = data_source
  end

  def title=(feed_title)
    @header_text_label.Text = feed_title
  end

  def image=(image_url)
    if image_url != nil
      @picture_box.Image = Bitmap.new(WebRequest.Create(image_url).GetResponse.GetResponseStream) if image_url != nil
    else
      @image_panel.Visible = false
    end
  end

  def initialize
    control           = UserControl.new
    content_panel     = Panel.new
    grid              = DataGridView.new
    style             = DataGridViewCellStyle.new
    link_column       = DataGridViewLinkColumn.new
    footer_strip      = ToolStrip.new
    image_panel       = Panel.new
    picture_box       = PictureBox.new
    close_item        = ToolStripLabel.new
    header_strip      = ToolStrip.new
    header_renderer   = ToolStripProfessionalRenderer.new
    header_text_label = ToolStripLabel.new

    content_panel.suspend_layout
    footer_strip.suspend_layout
    image_panel.suspend_layout
    header_strip.suspend_layout
    control.suspend_layout
    
    content_panel.Controls.Add(grid)
    content_panel.Controls.Add(footer_strip)
    content_panel.Controls.Add(image_panel)
    content_panel.Dock = DockStyle::Fill
    content_panel.Location = Point.new(0, 25)
    content_panel.Padding = Padding.new(3)
    content_panel.Size = Size.new(390, 175)

    link_column.AutoSizeMode     = DataGridViewAutoSizeColumnMode::Fill
    link_column.DataPropertyName = 'title'
    link_column.HeaderText       = 'title'
    link_column.ReadOnly         = true
    link_column.Resizable        = DataGridViewTriState::True
    link_column.SortMode         = DataGridViewColumnSortMode::Automatic

    style.Alignment          = DataGridViewContentAlignment::MiddleLeft
    style.BackColor          = SystemColors.Window
    style.Font               = Font.new('Microsoft Sans Serif', 8.25)
    style.ForeColor          = SystemColors.ControlText
    style.SelectionBackColor = Color.FromArgb(255, 254, 249)
    style.WrapMode           = DataGridViewTriState::False

    grid.AllowUserToAddRows       = false
    grid.AllowUserToDeleteRows    = false
    grid.AllowUserToOrderColumns  = true
    grid.AllowUserToResizeColumns = false
    grid.AllowUserToResizeRows    = false
    grid.AutoGenerateColumns      = false
    grid.BackColor                = Color.FromArgb(255, 254, 249)
    grid.BorderStyle              = BorderStyle::None
    grid.CellBorderStyle          = DataGridViewCellBorderStyle::None
    grid.ColumnHeadersVisible     = false
    grid.Columns.Add(link_column)
    grid.DefaultCellStyle         = style
    grid.Dock                     = DockStyle::Fill
    grid.Location                 = Point.new(3, 62)
    grid.ReadOnly                 = true
    grid.RowHeadersVisible        = false
    grid.RowTemplate.Height       = 18
    grid.Size = Size.new(384, 85)

    footer_strip.BackColor        = Color.FromArgb(255, 254, 249)
    footer_strip.Dock             = DockStyle::Bottom
    footer_strip.GripStyle        = ToolStripGripStyle::Hidden
    footer_strip.Location         = Point.new(3, 147)
    footer_strip.RenderMode       = ToolStripRenderMode::System
    footer_strip.ShowItemToolTips = false
    footer_strip.Size             = Size.new(384, 25)
    
    image_panel.AutoSize     = true
    image_panel.AutoSizeMode = AutoSizeMode::GrowAndShrink
    image_panel.BackColor    = Color.White
    image_panel.Controls.Add(picture_box)
    image_panel.Dock         = DockStyle::Top
    image_panel.Location     = Point.new(3, 3)
    image_panel.Padding      = Padding.new(0, 0, 0, 3)
    image_panel.Size         = Size.new(384, 59)

    picture_box.Location = Point.new(3, 3)
    picture_box.Size     = Size.new(100, 50)
    picture_box.SizeMode = PictureBoxSizeMode::AutoSize

    header_strip.GripStyle = ToolStripGripStyle::Hidden
    header_strip.Items.Add(header_text_label)
    header_strip.Items.Add(close_item)
    header_strip.Size      = Size.new(390, 25)

    header_renderer.RenderToolStripBackground do |sender, args|
      start_color = Color.White
      end_color   = Color.FromArgb(168, 186, 212)
      lines       = 6

      bounds_height = args.AffectedBounds.Height
      bounds_width  = args.AffectedBounds.Width
      height        = (bounds_height + lines - 1) / lines
      stripe_height = height - 1
      
      auto_dispose(LinearGradientBrush.new(Rectangle.new(0, 0, bounds_width, stripe_height),
                                           start_color, end_color, LinearGradientMode::Horizontal)) do |b|
        0.upto(lines - 1) do |i|
          args.Graphics.FillRectangle(b, Rectangle.new(0, height * i + 1, bounds_width, stripe_height))
        end
      end

      auto_dispose(SolidBrush.new(Color.FromArgb(177, 177, 177))) do |b|
        args.Graphics.FillRectangle(b, Rectangle.new(0, bounds_height - 1, bounds_width, 1))
      end
    end
    header_strip.Renderer = header_renderer

    header_text_label.ForeColor = Color.FromArgb(49, 97, 156)
    header_text_label.Overflow  = ToolStripItemOverflow::Never
    header_text_label.Padding   = Padding.new(5, 0, 0, 0)
    header_text_label.Size      = Size.new(42, 22)
    header_text_label.Text      = '[Text]'

    close_item.Alignment    = ToolStripItemAlignment::Right
    close_item.DisplayStyle = ToolStripItemDisplayStyle::Image
    close_item.Image        = Bitmap.new('./images/close.png')
    close_item.Overflow     = ToolStripItemOverflow::Never
    close_item.Size         = Size.new(16, 22)
    close_item.Click do |sender, args|
      control.Parent.Controls.Remove(control)
    end

    control.AutoScaleDimensions = SizeF.new(6.0, 13.0)
    control.AutoScaleMode       = AutoScaleMode::Font
    control.BackColor           = Color.FromArgb(255, 255, 255)
    control.BorderStyle         = BorderStyle::FixedSingle
    control.Controls.Add(content_panel)
    control.Controls.Add(header_strip)
    control.MinimumSize         = Size.new(390, 30)
    control.Size                = Size.new(390, 200)

    control.Load do |sender, args|
      grid.CellContentClick do |sender, args|
        url = @data_source.Rows[args.RowIndex]['link']
        BrowserView.new(url).form.Show
      end
    end

    content_panel.ResumeLayout(false)
    content_panel.PerformLayout
    footer_strip.ResumeLayout(false)
    footer_strip.PerformLayout
    image_panel.ResumeLayout(false)
    image_panel.PerformLayout
    header_strip.ResumeLayout(false)
    header_strip.PerformLayout
    control.ResumeLayout(false)
    control.PerformLayout

    @header_text_label = header_text_label
    @image_panel       = image_panel
    @picture_box       = picture_box
    @control           = control
    @grid              = grid
  end
end

class MainForm
  def initialize
    form               = Form.new
    top_panel          = Panel.new
    menu               = MenuStrip.new
    label2             = Label.new
    combo_box          = ComboBox.new
    choose_feed_button = Button.new

    top_panel.suspend_layout
    form.suspend_layout

    form.text = 'Ruby RSS Reader'
    form.size = Size.new(831, 500)

    flow_panel               = FlowLayoutPanel.new
    flow_panel.auto_scroll   = true
    flow_panel.dock          = DockStyle::Fill
    flow_panel.FlowDirection = FlowDirection::LeftToRight
    flow_panel.size          = Size.new(831, 335)
    flow_panel.tab_index     = 0

    flow_panel.resize do |sender, args|
      width = flow_panel.client_size.width - flow_panel.padding.left - flow_panel.padding.right
      if form.client_size.width > 0 and width != @width
        @width = width
        0.upto(flow_panel.controls.count - 1) do |i|
          # todo: need to add operator to check against CLR type
          # should i overload the is operator to make this happen?
          view       = flow_panel.controls[i]
          padding    = view.margin.right + view.margin.left
          view_width = view.minimum_size.width + padding
          half_width = @width / 2

          if half_width > view_width
            view.width = half_width - padding
          else
            view.width = @width - padding
          end
        end
      end
    end

    form.controls.add(flow_panel)

    top_panel.dock     = DockStyle::Top
    top_panel.location = Point.new(0, 72)
    top_panel.size     = Size.new(831, 52)

    form.controls.add(top_panel)

    menu_renderer              = ToolStripProfessionalRenderer.new
    menu_renderer.RoundedEdges = false

    menu_renderer.RenderToolStripBackground do |sender, args|
      auto_dispose(SolidBrush.new(Color.FromArgb(91, 91, 91))) do |b|
        args.Graphics.FillRectangle(b, args.Graphics.ClipBounds)
      end
    end

    menu_renderer.RenderMenuItemBackground do |sender, args|
      if args.Item.Selected
        auto_dispose(SolidBrush.new(Color.FromArgb(80, 80, 80))) do |b|
          args.Graphics.FillRectangle(b, args.Graphics.ClipBounds)
        end
      end
    end
    
    menu.Renderer  = menu_renderer
    menu.ForeColor = Color.White
    menu.Items.Add('File')
    menu.Items.Add('Options')
    menu.Items.Add('Help')
    menu.Location  = Point.new(0, 0)
    menu.Size      = Size.new(831, 24)

    form.Controls.Add(menu)

    label2.Location = Point.new(14, 21)
    label2.Text     = '&Choose a Feed:'

    top_panel.Controls.Add(label2)

    @data_source    = RssLinks.load('.\offline_links.dat')
    
    combo_box.Location          = Point.new(118, 17)
    combo_box.Size              = Size.new(210, 21)
    combo_box.ValueMember       = 'link'
    combo_box.DisplayMember     = 'name'
    combo_box.FormattingEnabled = true
    combo_box.DataSource        = @data_source

    top_panel.Controls.Add(combo_box)

    choose_feed_button.Size     = Size.new(32, 23)
    choose_feed_button.Location = Point.new(337, 16)
    choose_feed_button.Text     = 'Go'
    choose_feed_button.Click do |sender, args|
      MessageBox.show("selected #{combo_box.selected_value}")
    end

    top_panel.Controls.Add(choose_feed_button)

    urls = @data_source.rows
    0.upto(urls.count - 1) do |i|
      feed = RssFeed.new(@data_source.rows[i]['link'])
      view = RssView.new
      view.bind_to(feed.items.to_data_table)
      view.title = @data_source.rows[i]['name'] 
      view.image = feed.image
      flow_panel.controls.add(view.control)
    end

    top_panel.resume_layout(false)
    form.resume_layout(false)

    flow_panel.resume_layout(false)
    flow_panel.perform_layout

    form.perform_layout

    @form = form
  end
end

WinFormsApp.run(MainForm)