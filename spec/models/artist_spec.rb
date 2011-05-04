require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Artist do
  
  it "should define an artist and should not be valid without name " do
    artist=Artist.new
    artist.should_not be_valid
    artist.name="kilians"
    artist.should be_valid
  end
  
  it "should have also url and image" do
    artist=Artist.new(:name=>"kilians")
    artist.url="http://www.last.fm/music/Parov+Stelar"
    artist.image=".png"
    artist.should be_valid
  end
end