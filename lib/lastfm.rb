class Lastfm
  include HTTParty
  base_uri="http://ws.audioscrobbler.com/2.0/"
  def initialize(login, password)
    @auth={:username=>login, :password=>password}
  end
  
  def last_fm_songs
    #?method=user.getrecenttracks&user={hier username}&api_key={hier api_key}
  end
end