class CoverImagesController < ApplicationController
  def index
    @cover_images = CoverImage.all
  end

  def new
  end

  def destroy
    @image = CoverImage.find(params[:id])
    @image.destroy
    flash[:success] = "已成功删除该图片"
    redirect_to cover_images_url
  end

  def create
  end
end
