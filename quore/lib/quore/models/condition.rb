class Condition < ApplicationRecord
  include Interpolatable

  belongs_to :conditionable, polymorphic: true

  def execute?
    interpolate(expression).eql? 'true'
  end

  def display_expression
    Interpolatable.unparse(expression)
  end
end
