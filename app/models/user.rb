class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :mobile_number, uniqueness: true
  validates_inclusion_of :role, :in => %w( admin agent customer guest )

  has_many :properties, foreign_key: "owner_id", dependent: :destroy

  enum role: [:admin, :agent, :customer]
end
