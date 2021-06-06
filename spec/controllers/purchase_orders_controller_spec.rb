require 'rails_helper'

RSpec.describe PurchaseOrdersController, type: :controller do
  before(:each) do
    @user = create(:user)
    @movie = create(:movie, plot: 'Plot 1')
  end

  describe '#create' do
    it 'return the purchase of content for a movie' do
      post :create, params: { email: @user.email, price: 200, movie: @movie, vide_type: 'HD'}
      expect(response.status).to eq(201)
      expect(JSON.parse(response.body)["message"]).to eq('Purchased Content Successfully')
      expect(PurchaseOrder.all.count).to eq 1
      expect(Content.first.purchase_order_id).to eq PurchaseOrder.first.id
    end
  end
end
