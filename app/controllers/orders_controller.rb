class OrdersController < ApplicationController
  before_action :authenticate!
  before_action :get_order, only: [:show, :update, :destroy]

  def index
    #顯示一個user下所有的訂單
    @orders = current_user.orders
  end

  def show
    #顯示一個訂單
    @order_items = @order.order_items
  end

  def create
    #建立訂單,狀態是還沒付款 not_paid
    if current_user.buy_now_cart_items.count == 0
      redirect_to cart_items_path, notice:"沒有商品"
      return
    end

    @order = Order.not_paid.create(
      user: current_user,
      username: current_user.username
    )
    current_user.buy_now_cart_items.each do |cart_item|
      begin
        OrderItem.create(
          order: @order,
          course: cart_item.course,
          price: cart_item.price
        )
      rescue
        @order.order_items.destroy_all
        @order.destroy

        redirect_to courses_path, notice: "訂單建立失敗"
      end
    end

    current_user.buy_now_cart_items.destroy_all
    redirect_to payments_path(order_id: @order.id), notice: "訂單建立成功"
  end

  def update
    #更新訂單, 狀態是已經付款 paid
    if params[:payment_method] == "credit_card"
      @order.paid!
      redirect_to courses_path, notice: "訂單付款成功"
      return
    else
      redirect_to courses_path, notice: "訂單待付款"
    end
  end

  def destroy
    # 訂單不會真的被刪除, 是更新訂單, 狀態是已取消 cancelled
  end

  def get_order
    @order = Order.find(params[:id])
    if !@order
      redirect_to courses_path, notice: "沒有這個訂單"
    end
  end

end
