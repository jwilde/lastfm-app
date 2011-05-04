require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Song do
  describe "validations" do
    it "should belong to an artist" do
      artist=Artist.new(:name=>"Kilians")
      song=Song.new
      song.artist=artist
      song.name="fight the start"
      song.should be_valid
    end
    
   it "should has name, artist, album,url and image" do
     artist=Artist.new(:name=>"Kilians")
     song=Song.new(:name=>"fight the start", :artist=>artist, :album=>"kill the kilians", :image=>".png", :url=>"http://www.last.fm/music/Parov+Stelar")
     song.name.should_not be nil
     song.artist.should_not be nil
     song.album.should_not be nil
     song.image.should_not be nil
     song.url.should_not be nil
   end
   it "should just be valid with given title and artist" do
     song=Song.new
     song.should_not be_valid
     song.name="fight the start"
     song.should_not be_valid
     song.artist=Artist.new(:name=>"kilians")
     song.should be_valid
   end
    
  end
  
end