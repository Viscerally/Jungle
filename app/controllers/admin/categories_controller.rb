class Admin::CategoriesController < ApplicationController

  http_basic_authenticate_with name:  ENV['AUTH_NAME'], password: ENV['AUTH_PASS']
  
  def new
    @categories = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to [:admin, :categories], notice: 'Category created!'
    else 
      render :new
    end

  end

  before_filter :authorize

  def cool
  end

  def free
  end

  
  
  def index
    @categories = Category.order(name: :desc).all
  end
  
  private
  
  def category_params
    params.require(:category).permit(
      :name
      )
    end
    
end


