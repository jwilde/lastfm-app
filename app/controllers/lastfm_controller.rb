class LastfmController < ApplicationController

  def show
    limit_songs=40
    limit_artists=5
    @user=User.new(params[:user])
    @songs=[]
    @artists=[]
    if @user.valid?
      @songs=@user.last_songs(limit_songs)
      @artists=@user.top_artists(limit_artists)
    end
    return [@songs, @artists]
  end
  
end