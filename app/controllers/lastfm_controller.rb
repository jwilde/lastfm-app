class LastfmController < ApplicationController

  def show
    @user=User.new(params[:user])
    @songs=[]
    if @user.valid?
      @songs=@user.last_songs
    end
  end
  
end