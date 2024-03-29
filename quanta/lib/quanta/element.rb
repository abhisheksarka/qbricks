require_relative 'element/base'
require_relative 'element/text_field'
require_relative 'element/text_area'
require_relative 'element/check_box'
require_relative 'element/radio'
require_relative 'element/select'
require_relative 'element/file_field'

module Quanta
  module Element
    KLASS_MAP = {
      Watir::CheckBox => CheckBox,
      Watir::TextField => TextField,
      Watir::TextArea => TextArea,
      Watir::Select => Select,
      Watir::Radio => Radio,
      Watir::FileField => FileField
    }
  end
end