class User
  include ActiveModel::Validations
  include ActiveModel::Conversion
  extend ActiveModel::Naming

  include HTTParty
  include Nokogiri
  
  attr_accessor :name
  
  validates_presence_of :name
  
  def initialize(attributes = {})
    unless attributes==nil
      attributes.each do |name, value|
        send("#{name}=", value)
      end
    end
  end
  
  #returns array of 100 songs, if not enough set new limit(max 200)
  def last_songs  
    response=HTTParty.get("http://ws.audioscrobbler.com/2.0/?method=user.getrecenttracks&user=#{self.name}&api_key=932798e3e342041747867884a8619147&limit=100").body
    songs=[]
    doc=Nokogiri::XML::parse(response)
    doc.xpath("//track").each do |t|
        song=Song.new
        ["name", "album", "artist", "image", "url"].each do |att|
          t.xpath("#{att}").each do |n|
            song.instance_variable_set("@#{att}", n.text)
          end
        end
        songs<<song
      end
    return songs
  end
  
  # default limit 50, if not enough set new limit
  def top_artists
    response=HTTParty.get("http://ws.audioscrobbler.com/2.0/?method=user.gettopartists&user=#{self.name}&api_key=932798e3e342041747867884a8619147").body
    artists=[]
    doc=Nokogiri::XML::parse(response)
    doc.xpath("//artist").each do |a|
        artist=Artist.new
        ["name", "url", "image"].each do |att|
          a.xpath("#{att}").each do |n|
            artist.instance_variable_set("@#{att}", n.text)
          end
        end
        artists<<artist
      end
    return artists
  end
    
end