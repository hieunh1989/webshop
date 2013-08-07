class Product
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name, type: String
  field :description, type: String
  field :price, type: Float

  has_many :product_images
  has_many :comments
  has_and_belongs_to_many :line_items
end