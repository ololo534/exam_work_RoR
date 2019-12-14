# frozen_string_literal: true
class SearchController < ApplicationController
  before_action :authorize
  def index; end

  def ajax
    @product1 = Product.find(params[:id_1])
    @product2 = Product.find(params[:id_2])
    @recipes1 = Specification.where(product_id: @product1.id)
    @recipes2 = Specification.where(product_id: @product2.id)
    @result = []
    @recipes1.each_with_index do |rec, i|
      rec.recipe_id == @recipes2[i].recipe_id ? @result.push(Recipe.find(rec.recipe_id)) : @result.push(0)
    end
    respond_to { |format| format.json { render json: { solution: @result } } }
  end
end
