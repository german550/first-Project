class Profession < ApplicationRecord
  belongs_to :user
  has_many_attached :image
  has_many :descriptions
end
