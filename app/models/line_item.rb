class LineItem
  include Mongoid::Document
  include Mongoid::Timestamps

  field :quantily, type: Integer

  has_and_belongs_to_many :products
end  