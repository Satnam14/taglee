class Api::AlbumsController < ApplicationController

  def create
    @album = Album.new(album_params)
    @album.user_id = current_user.id
    if @album.save
      add_media(@album)
      render :json => @album
    else
      render :json => @album.errors.full_messages, :status => 422
    end
  end

  def index
    @albums = current_user.albums
    render :json => @albums
  end

  def destroy
    @album = Album.find_by(id: params[:id])
    @album.destroy if @album
    render :json => {}
  end

  def show
    @album = Album.find_by(id: params[:id])
    render :json => { 'album' => @album, 'media' => @album.medium }
  end

  private

  def add_media(album)
    results = Instagram.tag_recent_media(album.tag)
    start_time = DateTime.parse(album.start)
    finish_time = DateTime.parse(album.finish)
    results.each do |medium|
      tag_time = DateTime.strptime(medium.created_time, '%s')
      if tag_time.between?(start_time, finish_time)
        medium_params = {}
        medium_params['url'] = medium.images.standard_resolution.url
        medium_params['link'] = medium.link
        medium_params['poster'] = medium.user.username
        medium_params['poster_profile'] = medium.user.profile_picture
        medium_params['caption'] = medium.caption.text
        medium_params['tag_time'] = medium.created_time
        medium_params['album_id'] = album.id
        Medium.create!(medium_params)
      end
    end
  end

  def album_params
    params.require(:album).permit(:tag, :start, :finish, :name)
  end

end
