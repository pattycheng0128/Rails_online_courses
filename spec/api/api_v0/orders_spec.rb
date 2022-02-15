describe ApiV0::Orders do
  before(:all) do
    @user = create(:user)
    @access_token = create(:api_access_token, user: @user)
  end

  # action: index
  context 'Get /api/v0/orders' do
    it 'should return 200 and orders' do
      get '/api/v0/orders', params: {access_key: @access_token.key}

      result = JSON.parse(response.body)

      expect(response.status).to eq(200)
      expect(result.size).to eq(@user.orders.size)
    end
  end

  # action: show
  context "Get /api/v0/posts/:id" do
    it "return a order by id" do
      order = create(:order, user: @user)

      get "/api/v0/orders/#{order.id}", params: {access_key: @access_token.key}
      result = JSON.parse(response.body)
      p "result:#{result}"

      expect(response.status).to eq(200)
      expect(result["username"]).to eq(order.username)
      p order.username
    end
  end

  # # action: create
  # context "Order /api/v0/orders" do
  #   it "create new post" do
  #     user_id = @user.id
  #     username = @user.username
  #     # pay_status = "paid"

  #     post "/api/v0/orders", params: {access_key: @access_token.key, user_id: user_id, username: username}
  #     result = JSON.parse(response.body)
  #     p "result:#{result}"
  #     expect(response.status).to eq(201)
  #     expect(result["user_id"]).to eq(user_id)
  #     expect(result["username"]).to eq(username)
  #   end
  # end

end