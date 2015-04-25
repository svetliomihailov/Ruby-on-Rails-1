class PhotosController < ApplicationController
  before_action :set_photo, only: [:show, :edit, :update, :destroy]
  # GET /photos
  def index
    @photos = Photo.all
  end

  # GET /photos/new
  def new
    @photo = Photo.new
  end

  # GET /photos/:id
  def show
  end

  # GET /photos/:id/edit
  def edit
  end

  # PATCH/PUT /posts/1
  def update
    respond_to do |format|
      if @photo.update(photo_params)
        format.html { redirect_to @photo, notice: 'Photo was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /photos/:id
  def destroy
    @photo.destroy
    respond_to do |format|
      format.html { redirect_to photos_url, notice: 'Photo was successfully destroyed.' }
    end
  end

  # POST /photos
  def create
    @photo = Photo.new photo_params

    respond_to do |format|
      if @photo.save
        format.html { redirect_to @photo, notice: 'Photo was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  private
    def set_photo
      @photo = Photo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def photo_params
      params.require(:photo).permit(:title, :url)
    end
end