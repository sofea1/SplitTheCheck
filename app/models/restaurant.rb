class Restaurant < ApplicationRecord

validates :name, :address, :city, :state, :zip, presence: true
validates :state, length: { is: 2 }, format: { with: /\A[A-Z]+\z/, message: "must be two UPPERCASE letters, e.g. CA"}
has_many :favorites
has_many :votes, class_name: "VoteHistory"
has_many :comments

  def add_comment(user_id, comment)
    Comment.create(restaurant_id:self.id, user_id:user_id, comment:comment).save
  end

  def add_favorite(user_id)
    Favorite.create(restaurant_id:self.id, user_id:user_id).save
  end

end
