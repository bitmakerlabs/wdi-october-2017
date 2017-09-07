class PicturesController < ApplicationController

  def create
    @picture = Picture.new
    @picture.title = params[:picture][:title]
    @picture.description = params[:picture][:description]
    @picture.url = params[:picture][:url]

    if @picture.save
      redirect_to pictures_path
    else
      render :new
    end
  end

  def new
    @picture = Picture.new
  end

  def index
    @pictures = Picture.all
  end

  def show
    @picture = Picture.find(params[:id])
  end

  def edit
    @picture = Picture.find(params[:id])
  end

  def update
    @picture = Picture.find(params[:id])
    @picture.title = params[:picture][:title]
    @picture.description = params[:picture][:description]
    @picture.url = params[:picture][:url]

    if @picture.save
      redirect_to picture_path(@picture)
    else
      render :edit
    end
  end

  def destroy
    @picture = Picture.find(params[:id])
    if @picture.destroy
      redirect_to pictures_path
    else
      render :show
    end
  end

end
