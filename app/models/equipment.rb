class Equipment < ActiveRecord::Base
  belongs_to :merchant

  validates :item, presence: true
  validates :price, presence: true
  validates :kind, presence: true
end
