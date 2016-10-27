class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :load_order, only: [:show, :update]

  def index
    @orders = current_user.orders.newest.paginate page: params[:page],
      per_page: Settings.per_page
  end

  def create
    if @cart.present?
      @order = Order.new order_params
      if @order.save
        UserMailer.order_mail(@order).deliver_now
        session.delete :cart
        flash[:success] = t "orders.create"
        redirect_to order_path @order
      else
        flash[:danger] = t "orders.fails"
        redirect_to :back
      end
    else
      flash[:danger] = t "carts.not_product"
      redirect_to carts_path
    end
  end

  def show
  end
  private
  def order_params
    params.require(:order).permit(:message).merge! user: current_user,
      order_total: @cart.total_price, cart: @cart
  end

  def load_order
    @order = Order.find_by id: params[:id]
    unless @order
      flash[:danger] = t "orders.not_found"
      redirect_to root_path
    end
  end
end
