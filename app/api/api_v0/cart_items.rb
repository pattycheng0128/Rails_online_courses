module ApiV0
  class CartItems < Grape::API
    before {authenticate!}

    # action:index, path: /api/v0/cart_items?access_key=your_key
    desc "Get all cart_items"
    get "/cart_items" do
      cart_items = current_user.buy_now_cart_items
      present cart_items, with: ApiV0::Entities::CartItem
    end

    #action:create

    #action:destroy
    desc "Delete course in cart items"
    params do
      requires :id, type:String, desc: "CartItem ID"
    end

  end
end