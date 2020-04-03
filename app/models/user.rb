class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :image
  has_one :provider, dependent: :destroy
  has_many :messages
  has_many :conversations, foreign_key: :sender_id
  has_many :comments, dependent: :destroy
end
