require 'rubyclr'

RubyClr::reference 'System'
RubyClr::reference 'System.Drawing'
RubyClr::reference 'System.Windows.Forms'

include System::Drawing
include System::Drawing::Drawing2D
include System::Windows::Forms

class HTMLReader
  def initialize(width, height, left, top, address)
    @browser = WebBrowser.new
    @browser.Location = Point.new(left, top)
    @browser.Size = Size.new(width, height)
    @browser.Navigate(address)
  end
  
  def getInstance
    return @browser
  end
  
  def getWidth
    return @browser.width
  end
  
  def getHeight
    return @browser.height
  end
  
  def getLeftPosition
    return @browser.left
  end
  
  def getTopPosition
    return @browser.top
  end
end
