class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :name, :mobile_number, :role, presence: true
  validates :mobile_number, uniqueness: true
  validates_inclusion_of :role, :in => %w( admin agent customer guest )

  has_many :properties, foreign_key: "owner_id", dependent: :destroy
  has_many :purchased_properties, class_name: "Property", foreign_key: "customer_id", dependent: :destroy

  enum role: [:admin, :agent, :customer]

  before_create :generate_authentication_token!

  private

    def generate_authentication_token!
      begin
        self.auth_token = Devise.friendly_token
      end while self.class.exists?(auth_token: auth_token)
    end
end
