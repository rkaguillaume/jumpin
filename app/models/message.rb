class Message
  include ActiveModel::Model
  attr_accessor :email, :like, :body, :frequencies, :recommendation
  validates :email, :like, :body, :frequencies, :recommendation, presence: true
end
