class UsersController < ApplicationController
  def create
    user = User.create(email: params[:email])
  end

  def index
    current_time = DateTime.current
    threshold_date = current_time - 2.days
    purchased_orders = PurchaseOrder.where(user_id: params[:user_id]).where('created_at > ?',threshold_date).pluck(:id)
    contents = Content.where(purchase_order_id: purchased_orders).includes(:purchasable, :purchase_order)
    contents = contents.sort{|c| current_time - c.purchase_order.created_at]}.map do |content| content.purchasable end
  end
end
