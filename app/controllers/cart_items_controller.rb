class CartItemsController < ApplicationController
  before_action :authenticate!
  before_action :get_cart, except: [:index, :destroy]
  before_action :get_cart_item, only: [:destroy]

  def index
    @buy_now_items = current_user.buy_now_cart_items
    @total_price = current_user.buy_now_cart.total_price
  end

  def create
    course = Course.find(params[:course_id])
    if !course
      redirect_to root_path, notice: "加入購物車失敗"
      return
    end

    CartItem.create(course: course, cart: @cart)
    redirect_to cart_items_path, notice: "加入購物車成功"
  end

  def destroy
    if @cart_item.present?
      @cart_item.destroy
      redirect_to cart_items_path, notice: "刪除成功"
    end
  end

  private
  def get_cart
    @cart = current_user.carts.find_by(cart_type: params[:cart_type])
    if !@cart
      redirect_to cart_items_path, notice: "沒有找到 cart"
    end
  end

  def get_cart_item
    @cart_item = CartItem.find(params[:id])
    if !@cart_item || (@cart_item.user != current_user)
      redirect_to cart_items_path, notice: "沒有找到 cart item"
    end
  end
end
