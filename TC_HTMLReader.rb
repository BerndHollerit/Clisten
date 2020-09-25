require 'HTMLReader'
require 'test/unit'

class TC_HTMLReader < Test::Unit::TestCase

  def setup
    @htmlreaderinstance = HTMLReader.new(200,300,20,30,"file://C:/clisten/index.html")
  end

  def testInitialization
    assert_instance_of(WebBrowser,@htmlreaderinstance.getInstance(),"Wrong data type initialized")
  end
  
  def testPositions
    assert_equal(200,@htmlreaderinstance.getWidth(),"Width in pixels is not well defined")
    assert_equal(300,@htmlreaderinstance.getHeight(),"Height in pixels is not well defined")
    assert_equal(20,@htmlreaderinstance.getLeftPosition(),"Left position in pixels is not well defined")
    assert_equal(30,@htmlreaderinstance.getTopPosition(),"Top position in pixels is not well defined")
  end

end
