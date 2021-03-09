class Transaction < ApplicationRecord
  validates :author_id, :name, :amount, presence: true
  validates :amount, scale: 2

  belongs_to :author, class_name: :User, foreign_key: :author_id
  has_and_belongs_to_many :groups
end
