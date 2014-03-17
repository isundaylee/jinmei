class CoverImagesController < ApplicationController
  before_action :require_admin

  def index
    @cover_images = CoverImage.all
  end

  def new
    @image = CoverImage.new
  end

  def destroy
    @image = CoverImage.find(params[:id])
    @image.destroy
    flash[:success] = "已成功删除该图片"
    redirect_to cover_images_url
  end

  def create
    puts '-'*80
    puts params
    file = params[:cover_image][:image]
    image = CoverImage.new
    image.image = file
    image.save

    flash[:success] = "添加首页图片成功"
    redirect_to cover_images_url
  end
end
