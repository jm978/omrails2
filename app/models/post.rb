class Post < ApplicationRecord
  belongs_to :user

  validates :user, presence: true
  validates :content, presence: true, length: { maximum: 250 }

end
