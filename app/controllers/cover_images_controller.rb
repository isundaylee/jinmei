class CoverImagesController < ApplicationController
  def index
    @cover_images = CoverImage.all
  end

  def new
  end

  def delete
  end

  def create
  end
end
