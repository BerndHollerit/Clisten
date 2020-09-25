require 'HTMLReader'
require 'rubyclr'

RubyClr::reference 'System'
RubyClr::reference 'System.Drawing'
RubyClr::reference 'System.Windows.Forms'

include System::Drawing
include System::Drawing::Drawing2D
include System::Windows::Forms

class GUIHomeScreen
  attr_accessor:frmHome
  
  def initialize(address)
    @imgBackgroundP900 = Bitmap.new("C:/clisten/background_p900.bmp")
    
    @frmHome = Form.new
    @frmHome.StartPosition = FormStartPosition::CenterScreen
    @frmHome.Size = Size.new(301,559)
    @frmHome.BackgroundImage = @imgBackgroundP900
    @frmHome.FormBorderStyle = FormBorderStyle::None
    @frmHome.SuspendLayout
      
    @reader=HTMLReader.new(241,346,27,120,address)
    @frmHome.Controls.Add(@reader.getInstance)
  
    @btnClose = Button.new
    @btnClose.Text = "Ende"
    @btnClose.Location = Point.new(27,466)
    @btnClose.Size = Size.new(241,20)
    @btnClose.Click do | sender, args |
      exit
    end
    
    @frmHome.Controls.Add(@btnClose)
         
    @frmHome.PerformLayout 
  end
  
  def getBackgroundImageInstance
    return @imgBackgroundP900
  end
  
  def getReader
    return @reader
  end
  
  def getFormInstance
    return @frmHome
  end
  
  def getButtonInstance
    return @btnClose
  end
  
  def getFormWidth
    return @frmHome.width
  end
  
  def getFormHeight
    return @frmHome.height
  end

  def getFormPosition
    return @frmHome.StartPosition
  end
  
  def getFormBorder
    return @frmHome.FormBorderStyle
  end
  
  def getButtonText
    return @btnClose.Text
  end

  def getButtonWidth
    return @btnClose.width
  end
  
  def getButtonHeight
    return @btnClose.height
  end    
  
  def getButtonLeft
    return @btnClose.left
  end  
  
  def getButtonTop
    return @btnClose.top
  end    
end

frame = GUIHomeScreen.new("file://C:/clisten/index-hauptseite.html")
#TODO REMOVE D:/Denise/index-hauptseite.html
Application.run(frame.frmHome)
