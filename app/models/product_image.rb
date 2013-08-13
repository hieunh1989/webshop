class ProductImage
  include Mongoid::Document
  include Mongoid::Timestamps

  field :photo_uid
  image_accessor :photo

  belongs_to :product, class_name: "Product"
end