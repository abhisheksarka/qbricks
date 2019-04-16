class FlowsStep < ApplicationRecord
  belongs_to :flow
  belongs_to :step
  default_scope { order('serial asc') }
end
