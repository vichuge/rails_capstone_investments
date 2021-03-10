class User < ApplicationRecord
  validates :username, presence: true
  validates_uniqueness_of :username

  has_many :transactions
  has_many :groups
end
