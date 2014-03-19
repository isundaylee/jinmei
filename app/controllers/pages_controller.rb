class PagesController < ApplicationController
  before_action :require_admin, only: [:create, :new, :destroy, :edit, :update]

  def index
    @title = '所有文章'
    @pages = Page.all
  end

  def show
    @page = Page.find(params[:id])
  end

  def create
    @page = Page.new(page_params)

    if @page.save
      flash[:success] = '页面创建成功'
      redirect_to path_path(@page)
    else
      render 'new'
    end
  end

  def new
    @page = Page.new
  end

  def destroy
    Page.find(params[:id]).delete

    redirect_to pages_path
  end

  def edit
    @page = Page.find(params[:id])
  end

  def update
    @page = Page.find(params[:id])

    if @page.update_attributes(page_params)
      flash[:success] = '页面更新成功'
      redirect_to page_path(@page)
    else
      render 'edit'
    end
  end

  def by_category
    category = Category.find(params[:category_id])
    @title = category.title
    @pages = category.pages

    render 'index'
  end

  private

    def page_params
      params.require(:page).permit(:title, :content, category_ids: [])
    end
end
