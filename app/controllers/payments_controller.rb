class PaymentsController < ApplicationController
  # 應該為金流頁面

  def index
    @order = Order.find(params[:order_id])
    # @order = Order.not_paid.find_by(id: params[:order_id], user: current_user)

    if !@order
      redirect_to courses_path, notice: "沒有這個訂單(payment)"
    end
  end

end
