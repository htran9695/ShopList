class Item < ActiveRecord::Base
  belongs_to :list
  acts_as_list column: :position, scope: :list
end
