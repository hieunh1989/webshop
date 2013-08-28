class Product
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name, type: String
  field :description, type: String
  field :price, type: Float
  field :categories, type: Array

  validates :name, presence: true
  validates :price, presence: true, numericality: true

  has_many :product_images, :dependent => :destroy
  accepts_nested_attributes_for :product_images, :reject_if => lambda { |a| a[:photo].blank? }, allow_destroy: true
  has_many :comments
  has_and_belongs_to_many :line_items 
end
