class Restaurant < ApplicationRecord

validates :name, :address, :city, :state, :zip, presence: true
validates :state, length: { is: 2 }, format: { with: /\A[A-Z]+\z/, message: "must be two UPPERCASE letters, e.g. CA"}

has_many :votes, class_name: "VoteHistory"

end
