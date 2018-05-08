class Job < ApplicationRecord
  include FileUploader::Attachment.new(:file)
  belongs_to :user
  belongs_to :language_from, class_name: 'Language'
  belongs_to :language_to, class_name: 'Language'
end
