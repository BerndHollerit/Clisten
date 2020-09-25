# This is a high-level helper library for Windows Forms programming. It can use
# any features of RubyCLR without restriction.

require 'rubyclr'

RubyClr::reference 'System.Data'
RubyClr::reference 'System.Drawing'
RubyClr::reference 'System.Windows.Forms'

include System
include System::Data
include System::Data::SqlClient
include System::Drawing
include System::Windows::Forms
include System::Xml

class MainForm
  attr_reader :form
end

module WinFormsApp
  include System::Windows::Forms

  def self.run(klass)
    Application.enable_visual_styles
    Application.set_compatible_text_rendering_default false
    Application.run(klass.new.form)
  end
end
