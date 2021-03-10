class Inversion < ApplicationRecord
  validates :author_id, :name, :amount, presence: true
  validates :amount, format: { with: /\A\d+(?:\.\d{2})?\z/ }

  belongs_to :author, class_name: :User, foreign_key: :author_id
  has_and_belongs_to_many :groups
end
