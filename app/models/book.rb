class Book < ApplicationRecord

  belongs_to :user
  attachment :image

  validates :title, presence: true
  validates :body, presence: true, length: { in: 0..200 }

end
