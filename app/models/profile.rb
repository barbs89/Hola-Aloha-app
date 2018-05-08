class Profile < ApplicationRecord

  include ImageUploader::Attachment.new(:image)

  belongs_to :user
  has_many :requests

  validates(
    :first_name,
    :last_name,
    :house_number,
    :street_name,
    :suburb, 
    :state,
    :postcode, 
    :country,
    presence: true)

  def full_name
    "#{first_name} #{last_name}"
  end

  def full_address
      "#{house_number} #{street_name} #{suburb} #{state} #{postcode} #{country}"
  end
  
end
