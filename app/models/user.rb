class User < ApplicationRecord
  validates :username, presence: true

  has_many :transactions
  has_many :groups
end
