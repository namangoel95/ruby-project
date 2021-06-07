class PurchaseOrdersController < ApplicationController
  def create
    user = User.find_by_email(params[:email])
    purchase_order = user.purchase_orders.create(price: params[:price], video_type: params[:vide_type])
    # assumption: At a time one movie or one season can be purchased
    content = if params[:movie]
                Movie.find_by(id: params[:movie])
              else
                Season.find_by(id: params[:season])
              end
              
    return if content.nil?
    purchased_content = purchase_order.contents.build
    purchased_content.purchasable_type = content.class.name
    purchased_content.purchasable_id = content.id

    if purchased_content.save!
      render_success(message: 'Purchased Content Successfully', status: :created)
    else
      render_error(message: 'Purchased Content failure', errors: purchased_content.errors,
      status: :unprocessable_entity)
    end
  end
end
      