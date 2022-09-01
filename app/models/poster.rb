class Poster < ApplicationRecord
    belongs_to :user
    has_many :pcomments, dependent: :destroy
    has_one_attached :image
    # validate :company_logo?

    # private

    # def company_logo?
    #   errors.add(:image, 'Please upload your post image.') unless image.attached?
    # end

    validates :image, attached: true, content_type: [:png, :jpg, :jpeg, message: 'You can upload only image?']
    # validates :image, dimension: { width: { in: 80..100 }, message: 'is not given between dimension' }
    # validates :image, attached: true, content_type: { in: 'application/jpg', message: 'is not a Image' }
    # validate :validate_attachment_filetypes
    has_noticed_notifications model_name: 'Notification'
    has_many :notifications, through: :user, dependent: :destroy
    # private
    # def validate_attachment_filetypes
    #     return unless rasim.attached?
    
    #     rasim.each do |attachment|
    #       unless attachment.content_type.in?(%w[image/jpeg image/png image/gif video/mp4 video/mpeg audio/x-wav audio/ogg])
    #         errors.add(:rasim, 'must be a JPEG, PNG, GIF, MP4, MP3, OGG, or WAV file')
    #       end
    #     end
    #   end
end
