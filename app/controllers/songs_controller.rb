class SongsController < ApplicationController
    def index 
        @songs = Song.all 
    end

    def new
        #find_song
        @song = Song.new
    end 

    def show
        #find_song
        @song = Song.find(params[:id])
    end 

    def edit 
        #find_song
        @song = Song.find(params[:id])
    end 

    def create
        @song = Song.new(song_params)
        if @song.valid?
          @song.save
          redirect_to song_path(@song)
        else
          render :new
        end 
    end 

    def update
        #find_song
        @song = Song.find(params[:id])
        if @song.update(song_params)
          redirect_to song_path(@song)
        else
          render :edit 
        end 
    end 

    def destroy
        #find_song
        @song = Song.find(params[:id])
        @song.destroy
        redirect_to songs_url
    end 

    private 
    def song_params
        params.require(:song).permit(:title, :release_year, :released, :genre, :artist_name)
    end 

    #def find_song
    #    @song = Song.find(params[:id])
    #end 
end