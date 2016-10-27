class SuggestsController < ApplicationController
  before_action :authenticate_user!
  before_action :load_suggest, except: [:new, :create, :index]

  def index
    @suggests = current_user.suggests.newest.paginate page: params[:page],
      per_page: Settings.per_page
  end

  def show
  end

  def new
    @suggest = Suggest.new
  end

  def create
    @suggest = Suggest.new suggest_params
    if @suggest.save
      UserMailer.suggest_mail(@suggest).deliver_now
      flash[:success] = t "suggest.create_suggest"
      redirect_to @suggest
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @suggest.update_attributes suggest_params
      flash[:success] = t "suggest.update"
      redirect_to @suggest
    else
      flash[:warning] = t "suggest.update_fail"
      render :edit
    end
  end

  def destroy
    if @suggest.destroy
      flash[:success] = t "suggest.deleted"
      redirect_to suggests_path
    else
      flash[:warning] = t "suggest.delete_fail"
      redirect_to root_path
    end
  end

  private
  def load_suggest
    @suggest = Suggest.find_by id: params[:id]
    unless @suggest
      flash.now[:warning] = t "suggest.not_found"
      redirect_to root_path
    end
  end

  def suggest_params
    params.require(:suggest).permit :name, :body, :image, :price, :status, :user_id
  end
end
