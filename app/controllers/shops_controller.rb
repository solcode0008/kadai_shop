class ShopsController < ApplicationController
  before_action :set_shop, only: %i[ show edit update destroy ]
  
  def index
    @shops = Shop.all
  end

  def show
  end



  def new
    @shop = Shop.new
  end

  def edit
  end

  def create
    @shop = Shop.new(shop_params)
    @shop.user_id = current_user.id

    respond_to do |format|
      if @shop.save
        format.html { redirect_to shop_url(@shop), notice: "Shop was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @shop.update(shop_params)
        format.html { redirect_to shop_url(@shop), notice: "shop was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @shop.destroy

    respond_to do |format|
      format.html { redirect_to shops_url, notice: "shop was successfully destroyed." }
    end
  end

  private
    def set_shop
      @shop = Shop.find(params[:id])
    end

    def shop_params
      params.require(:shop).permit(:name, :address, :rate, :memo)
    end
end
