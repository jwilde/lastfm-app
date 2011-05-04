require File.expand_path(File.dirname(__FILE__) + '/../../spec/spec_helper')

describe LastfmController do
  
  it "should return songs" do
    user=User.new(:name=>"Demo666")
    User.stub!(:new).and_return(user)
    get :show
    assigns[:songs].should_not be nil
    assigns[:artists].should_not be nil
    assigns[:user].should_not be nil
    assigns[:user].should be_valid
    assigns[:songs].is_a?(Array).should be true
    assigns[:songs][0].is_a?(Song).should be true
    assigns[:artists].is_a?(Array).should be true
    assigns[:artists][0].is_a?(Artist).should be true
    response.should be_success
  end
end