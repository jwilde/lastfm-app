class LastfmController < ApplicationController
  
  before_filter :find_user, :except => :show
  before_filter :clear_session, :only => :show
  def index
    respond_to :html
  end
  
  def show
    @user=User.new(params[:user])
    session[:user]=@user
    songs_and_artists
    respond_to do |wants|
      wants.html do
      end
    end
  end
  
  def replace_songs
    logger.debug params
    #@user=session[:user]
    songs_and_artists
   
    @limit_songs=params[:limit_songs]
    render :update do |page|
      page.replace_html "song_div", :partial => "song_list", :locals=>{:songs=> @songs, :limit_songs=> @limit_songs}
    end
  end
  
  def replace_artists
    songs_and_artists
    @limit_artists=params[:limit_artists]
    render :update do |page|
      page.replace_html "artist_div", :partial => "artist_list", :locals=>{:artists=> @artists, :limit_artists=>@limit_artists}
    end
  end
  
  private
  def songs_and_artists
    @songs=[]
    @artists=[]
    logger.debug @user.inspect
    if @user.valid?
      @songs=@user.last_songs
      @artists=@user.top_artists
    end
  end
  
  def clear_session
    session[:user] = nil
  end
  
  def find_user
    @user=session[:user]
  end
  
end