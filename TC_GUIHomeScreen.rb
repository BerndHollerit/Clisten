require 'GUIHomeScreen'
require 'test/unit'

class TC_GUIHomeScreen < Test::Unit::TestCase

  def setup
    @guihomescreen = GUIHomeScreen.new("file://C:/clisten/index.html")
  end

  def testInitialization
    assert_instance_of(Bitmap,@guihomescreen.getBackgroundImageInstance(),"Wrong data type initialized")
    assert_instance_of(Form,@guihomescreen.getFormInstance(),"Wrong data type initialized")
    assert_instance_of(Button,@guihomescreen.getButtonInstance(),"Wrong data type initialized")
    assert_instance_of(HTMLReader,@guihomescreen.getReader(),"Wrong data type initialized")
  end
  
  def testForm
    assert_equal(301,@guihomescreen.getFormWidth(),"Form width in pixels is not well defined")
    assert_equal(559,@guihomescreen.getFormHeight(),"Form height in pixels is not well defined")
    assert_equal(1,@guihomescreen.getFormPosition(),"Form position is not centered")
    assert_equal(0,@guihomescreen.getFormBorder(),"Form border exists -> should be invisible")
  end

  def testButton
    assert_equal("Ende",@guihomescreen.getButtonText(),"Button text is not expected")
    assert_equal(241,@guihomescreen.getButtonWidth(),"Button width is not expected")
    assert_equal(20,@guihomescreen.getButtonHeight(),"Button height is not expected")
    assert_equal(27,@guihomescreen.getButtonLeft(),"Button left position is not well defined")
    assert_equal(466,@guihomescreen.getButtonTop(),"Button top position is not well defined")
  end
end
