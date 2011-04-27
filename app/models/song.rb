class Song
  include ActiveModel::Validations
  include ActiveModel::Conversion
  extend ActiveModel::Naming
  
  attr_accessor :name, :artist, :album, :image
  
  validates_presence_of :name, :artist
  
  def initialize(attributes = {})
    unless attributes==nil
      attributes.each do |name, value|
        send("#{name}=", value)
      end
    end
  end

end
