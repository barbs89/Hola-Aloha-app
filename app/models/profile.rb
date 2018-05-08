class Profile < ApplicationRecord

  include ImageUploader::Attachment.new(:image)

  belongs_to :user
  has_many :requests
  
end
