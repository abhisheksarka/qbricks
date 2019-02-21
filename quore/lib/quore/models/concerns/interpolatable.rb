require 'active_support/concern'
require 'erb'

module Interpolatable
  extend ActiveSupport::Concern

  def interpolate?(v)
    v.is_a? String and v.include? Interpolatable.start_delimiter
  end

  def interpolate(v)
    interpolate?(v) ? ERB.new(v).result(binding) : v
  end

  module_function

  def start_delimiter
    '<%='
  end

  def end_delimiter
    '%>'
  end

  def parse(str)
    str = str.to_s.strip
    return str if str.blank?

    str = "#{start_delimiter} " << str if !str.starts_with? start_delimiter
    str = str << " #{end_delimiter}" if !str.ends_with? end_delimiter
    str.strip
  end

  def unparse(str)
    str = str.to_s.strip
    return str if str.blank?

    str = str.sub(start_delimiter, '') if str.starts_with? start_delimiter
    str = str.reverse.sub(end_delimiter.reverse, '').reverse if str.ends_with? end_delimiter
    str.strip
  end
end
