class Description < ApplicationRecord
  belongs_to :profession
  belongs_to :user
  has_one_attached :image
end
