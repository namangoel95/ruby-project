class PurchaseOrdersController < ApplicationController
  def create
    user = User.find(params[:email])
    purchase_order = user.purchase_orders.create
    movies = Movie.where(id: params[:movies])
    seasons = Season.where(id: params[:seasons])
    contents = movies + seasons
    contents.each do |content|
      c = purchase_order.contents.build
      c.purchasable_type = content.class.name
      c.purchasable_id = content.id
      c.save
    end
  end

  def index
  end
end
