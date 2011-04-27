class User
  include ActiveModel::Validations
  include ActiveModel::Conversion
  extend ActiveModel::Naming

  include HTTParty
  
  attr_accessor :name
  
  validates_presence_of :name
  
  def initialize(attributes = {})
    unless attributes==nil
      attributes.each do |name, value|
        send("#{name}=", value)
      end
    end
  end
  
  def last_songs
    response=HTTParty.get("http://ws.audioscrobbler.com/2.0/?method=user.getrecenttracks&user=#{self.name}&api_key=932798e3e342041747867884a8619147").body
    doc= REXML::Document.new(response)
    songs=[]
    REXML::XPath.each(doc, "//track") do |t|
      song=Song.new
      puts 0
      ["name", "album", "artist", "image"].each do |att|
        REXML::XPath.each(t, "#{att}") do |n|
          song.instance_variable_set("@#{att}", n.text)
        end
      end
      songs<<song
    end
    return songs
  end
end