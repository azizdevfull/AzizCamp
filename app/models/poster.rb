class Poster < ApplicationRecord
    # validates :title, presence: true, length: { minimum:5, maximum:50 }
    # validates :title, presence: true, length: { minimum:10, maximum:100 }
    # validates :attribute
    belongs_to :user
    has_many :comments, dependent: :destroy
    has_many :pcomments, dependent: :destroy
end
