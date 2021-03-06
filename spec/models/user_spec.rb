require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe User do
  
  describe "validations" do
    it "should not be valid without name" do
      user=User.new
      user.should_not be_valid
      user.name="Nutzername"
      user.should be_valid
    end
  end
  
  describe "lastfm" do
    it "should return songs" do
      user=User.new
      user.name="Demo666"
      songs=user.last_songs
      songs.is_a?(Array).should be true
      songs.length.should == 100
    end
    
    it "should get top artists" do
      user=User.new
      user.name="Demo666"
      artists=user.top_artists
      artists.is_a?(Array).should be true
      artists.length.should == 50
    end
  end
  
end