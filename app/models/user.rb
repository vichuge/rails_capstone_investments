class User < ApplicationRecord
  validates :username, presence: true
  validates_uniqueness_of :username

  has_many :inversions, dependent: :destroy
  has_many :groups
end
