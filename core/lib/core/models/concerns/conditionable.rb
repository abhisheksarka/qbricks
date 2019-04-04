require 'active_support/concern'

module Conditionable
  extend ActiveSupport::Concern

  included do
    has_one :condition, as: :conditionable
  end

  def execute?(binding = nil)
    condition.blank? ? true : condition.execute?(binding)
  end

  def display_condition_expression
    condition.try(:display_expression)
  end
end
