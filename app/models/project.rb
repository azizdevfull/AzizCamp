class Project < ApplicationRecord
  has_many :attacher, dependent: :destroy
  has_many :tasks, dependent: :destroy
  belongs_to :user
  validates :name, :description, presence: true
end
