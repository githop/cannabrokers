class Inventory < ActiveRecord::Base
  belongs_to :flower
  belongs_to :concentrate
  belongs_to :edible
  belongs_to :merchant
end
