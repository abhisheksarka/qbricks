class Condition < ApplicationRecord
  include Interpolatable

  belongs_to :conditionable, polymorphic: true

  def execute?(binding = nil)
    interpolate(expression, binding).eql?('true') rescue false
  end

  def display_expression
    Interpolatable.unparse(expression)
  end
end
