class Admin::CategoriesController < ApplicationController
  def new
  @categories = Category.new
  end

  def create
  @categories = Category.new(category_params)
  end

  def index
  @categories = Category.order(id: :desc).all
  end
end

