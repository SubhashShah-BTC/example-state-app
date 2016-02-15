class Property < ActiveRecord::Base
  enum available_for: [:rent, :sale]

  validates :description, :available_for, :owner_id, presence: true

  has_one :address, dependent: :destroy
  belongs_to :owner, class_name: "User", foreign_key: "owner_id"
  has_many :pictures, dependent: :destroy

  accepts_nested_attributes_for :address
  accepts_nested_attributes_for :pictures, :allow_destroy => true

  scope :by_country, ->(country) { joins(:address).where("addresses.country like ?", "%#{country}%")}
end
