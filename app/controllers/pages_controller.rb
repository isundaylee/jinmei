class PagesController < ApplicationController
  before_action :require_admin, only: [:create, :new, :destroy, :edit, :update]

  def index
    @pages = Page.all
  end

  def show
  end

  def create
    @page = Page.new(page_params)

    if @page.save
      flash[:success] = '页面创建成功'
      redirect_to pages_path
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
      redirect_to pages_path
    else
      render 'edit'
    end
  end

  private

    def page_params
      params.require(:page).permit(:title, :content, category_ids: [])
    end
end
