class PhotosController < ApplicationController  
    def index 
        @photos = Photo.all 
        render 'photos/index'
    end 
    
    def show 
        @photo = Photo.first
        render :show
    end
end