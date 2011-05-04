class Artist
  include ActiveModel::Validations
  include ActiveModel::Conversion
  extend ActiveModel::Naming
  
  attr_accessor :name, :url, :image
  
  validates_presence_of :name
  validates_format_of :url, :with => /^(http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(([0-9]{1,5})?\/.*)?$/ix, :allow_nil=>true
  
  def initialize(attributes = {})
    unless attributes==nil
      attributes.each do |name, value|
        send("#{name}=", value)
      end
    end
  end
end
