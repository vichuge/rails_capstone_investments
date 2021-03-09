class Group < ApplicationRecord
  validates :user_id, :name, :icon, presence: true
  belongs_to :user
  has_and_belongs_to_many :transactions
end
