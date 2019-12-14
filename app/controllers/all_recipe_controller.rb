# frozen_string_literal: true
class AllRecipeController < ApplicationController
  before_action :authorize
  def index
    @recipes = Recipe.all
  end

  def show
    @recipe = Recipe.find(params[:id])
    @specifications = Specification.where(:recipe_id => @recipe.id)
    @product = []
    @specifications.each { |s| @product.push(Product.find(s.product_id)) }
  end

end
