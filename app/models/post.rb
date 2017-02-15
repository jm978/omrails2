class Post < ApplicationRecord
  belongs_to :user

  validates :user, presence: true
  validates :content, presence: true, length: { maximum: 250 }

  acts_as_votable

  has_attached_file :image
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  acts_as_commentable

end
