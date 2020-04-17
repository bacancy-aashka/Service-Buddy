class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :image, dependent: :destroy
  has_one :provider, dependent: :destroy
  has_many :messages
  has_many :conversations, foreign_key: :sender_id
  has_many :comments, dependent: :destroy

  # VALIDATION :
  # validates :firstname, :lastname, presence: true
  # validate :birth_date_future?
  # validates :contact, :presence => { :message => 'is not valid' },
  #                     :numericality => true,
  #                     :length => { :minimum => 10, :maximum => 15 }

  def fullname
    "#{firstname.capitalize} #{lastname.capitalize}"
  end

  def self.mail_for_today
    user = User.first
    DailyAppointmentsMailer.mail_to_providers(user).deliver_now
  end


  # private

  # def birth_date_future?
  #   if dob.present?
  #     if dob > Date.today
  #       errors.add(:dob, "can't be in the future")
  #     end
  #   else
  #     errors.add(:dob, "can't be blank")
  #   end  
  # end

end
