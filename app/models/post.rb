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



  def self.search(keyword)
    where(["titles LIKE ? OR content LIKE ?", "%#{keyword}%", "%#{keyword}%"])
  end
  
  



end
