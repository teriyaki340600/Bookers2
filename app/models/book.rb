class Book < ApplicationRecord

  belongs_to :user
  validates :title, presence: true
  validates :body, length: {in: 2..20}

end
