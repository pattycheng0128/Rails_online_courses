module ApiV0
  class Orders < Grape::API
    before { authenticate! }

    # action:index, path: /api/v0/orders?access_key=your_key
    desc "Get all your orders"
    get "/orders" do
      orders = current_user.orders
      present orders, with: ApiV0::Entities::Order
    end

    # action:show, path: /api/v0/orders/:id?access_key=your_key
    desc "Get your order"
    params do
      requires :id, type: String, desc: 'Order ID'
    end

    get "/orders/:id" do
      order = current_user.orders.find_by(id: params[:id])
      present order, with: ApiV0::Entities::Order
    end

    # # action:create
    # desc "Create new order"
    # params do
    #   requires :user_id, type: Integer
    #   requires :username, type: String
    #   # requires :pay_status, type: Integer
    # end
    # post "/orders" do
    #   order = current_user.orders.new(declared(params, include_missing: false).except(:access_key))

    #   if order.save
    #     present order, with: ApiV0::Entities::Order
    #   else
    #     raise StandardError, $!
    #   end
    # end

  end
end