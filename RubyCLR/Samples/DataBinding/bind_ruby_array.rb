require 'winforms'

class MainForm
  def initialize
    form      = Form.new
    form.Text = 'Ruby WinForms App'

    names = []
    names << 'John' << 'Paul' << 'George' << 'Ringo'

    list = ListBox.new
    list.data_source = names.make_bindable
    form.controls.add(list)
    
    @form = form
  end
end

WinFormsApp.run(MainForm)
