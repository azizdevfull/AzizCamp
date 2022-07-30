class Poster < ApplicationRecord
    # validates :title, presence: true, length: { minimum:5, maximum:50 }
    # validates :title, presence: true, length: { minimum:10, maximum:100 }
    # validates :attribute
    belongs_to :user
    has_many :pcomments, dependent: :destroy
    has_one_attached :image
end
