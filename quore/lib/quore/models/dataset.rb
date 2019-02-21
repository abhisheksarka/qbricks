class Dataset < ApplicationRecord
  belongs_to :site
end

# {
#   'basics': {
#     'construction_type': {
#       'our_value': 'their_value'
#     }
#   }
# }
#
# vmap('basics', 'construction_type')
# maps['basics']['construction_type'][params['basics']['construction_type']]

{

}