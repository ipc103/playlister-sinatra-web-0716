class SongsController < ApplicationController

  get '/songs/new' do
    @genres = Genre.all
    erb :'songs/new'
  end

  get '/songs/:id' do
    @song = Song.find(params[:id])
    erb :'songs/show'
  end

  # CHALLENGE: This controller action adds the song's genres twice. Why???
  post '/songs' do
    # {song: {name: 'Kenny G Christmas', genre_ids: [1, 2, 3]}}
    @song = Song.new(params[:song])

    params[:song][:genre_ids].each do |genre_id|
      @song.genres << Genre.find(genre_id)
    end

    @song.save

    redirect "/songs/#{@song.id}"
  end

end
