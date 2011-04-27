require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Song do
  describe "validations" do
    it "should has name, artist, album and image" do
      song=Song.new(:name=>"fight the start", :artist=>"kilians", :album=>"kill the kilians", :image=>".png")
      song.name.should_not be nil
      song.artist.should_not be nil
      song.album.should_not be nil
      song.image.should_not be nil
    end
    it "should just be valid with given title and artist" do
      song=Song.new
      song.should_not be_valid
      song.name="fight the start"
      song.should_not be_valid
      song.artist="kilians"
      song.should be_valid
    end
    
  end
  
end