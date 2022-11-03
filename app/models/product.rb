class Product < ApplicationRecord
  include ImageUploader::Attachment(:image)
  belongs_to :user
  belongs_to :shop
  validates :name, presence: true
  validates :description, presence: true
  validates :price, presence: true
end
