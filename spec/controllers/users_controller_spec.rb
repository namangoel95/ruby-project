require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  before(:each) do
    @user = create(:user)
    purchase_order = create(:purchase_order, user_id: @user.id, price: 200, video_type: 'SD')
    Content.create(purchasable: create(:movie), purchase_order_id: purchase_order.id)
  end

  describe '#index' do
    it 'returns the contents which are remaining to watch ' do
      get :index, params: { user_id: @user.id}
      expect(response.status).to eq 200
      contents = JSON.parse(response.body)["data"]["titles"]

      expect(contents.pluck('title')).to eq([Movie.last.title])
    end
  end
end