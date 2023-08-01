class Post < ApplicationRecord
  validates :titles, {presence: true, length: {maximum: 100}}
  validates :content, {presence: true, length: {maximum: 1000}}
  validates :user_id, {presence: true}

  belongs_to :user
  has_many :comments


  def user
    return User.find_by(id: self.user_id)
  end

  has_rich_text :content

end
