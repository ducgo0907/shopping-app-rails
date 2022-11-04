class Shop < ApplicationRecord
  include ImageUploader::Attachment(:image)
  has_many :products
  belongs_to :user
end