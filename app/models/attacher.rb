class Attacher < ApplicationRecord
  belongs_to :project
  # mount_uploader :attachment, AttachmentUploader # Tells rails to use this uploader for this model.   
  has_one_attached :upload
end
