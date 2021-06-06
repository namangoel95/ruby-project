require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  before(:each) do
    @user = create(:user)
    purchase_order = create(:purchase_order, user_id: @user.id, price: 200, video_type: 'SD')
    purchased_content = purchase_order.contents.build
    purchased_content.purchasable_type = 'Movie'
    purchased_content.purchasable_id = 1
    purchased_content.created_at = purchase_order.created_at - 5.hours
    purchased_content.save(validate: false)
  end

  describe '#index' do
    it 'returns the contents which are remaining to watch ' do
      get :index, params: { user_id: @user.id}
      expect(response.status).to eq 200
      contents = JSON.parse(response.body)["data"]["contents"]
      expect(contents).to be_present
    end

    it 'does not returns the contents if its expired' do
      get :index, params: { user_id: @user.id}
      expect(response.status).to eq 200
      contents = JSON.parse(response.body)["data"]["contents"]
      expect(contents).to eq nil
    end
  end
end