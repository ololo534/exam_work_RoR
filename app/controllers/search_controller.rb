# frozen_string_literal: true

class SearchController < ApplicationController
  before_action :authorize
  def index; end

  def ajax
    @product1 = Product.find(params[:id_1])
    @product2 = Product.find(params[:id_2])
    ids = Recipe.joins(:specifications).where(specifications: { product_id: @product1.id })
                .or(Recipe.joins(:specifications).where(specifications: { product_id: @product2.id }))
                .group('recipes.id')
                .having('count(specifications.id) = 2')
                .pluck(:id)
    @result = Recipe.find(ids)
    respond_to { |format| format.json { render json: { solution: @result } } }
  end
end
