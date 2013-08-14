class ProductImage
  include Mongoid::Document
  include Mongoid::Timestamps

  field :photo_uid
  image_accessor :photo
  # attr_accessible :file

  belongs_to :product  
  # has_mongoid_attached_file :file
end