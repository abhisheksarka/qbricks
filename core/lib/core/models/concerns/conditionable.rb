require 'active_support/concern'

module Conditionable
  extend ActiveSupport::Concern

  included do
    has_one :condition, as: :conditionable
  end

  def execute?
    condition.blank? ? true : condition.execute?
  end

  def display_condition_expression
    condition.try(:display_expression)
  end
end
