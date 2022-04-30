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
    # @company.users.id = current_user.id TODO ログイン機能の実装
    @shop.user_id = 1

    respond_to do |format|
      if @company.save
        format.html { redirect_to companies_show_path, company: @company, notice: "Company was successfully created." }
        # format.json { render :show, status: :created, location: @company }
      else
        format.html { render :new, status: :unprocessable_entity }
        # format.json { render json: @company.errors, status: :unprocessable_entity }
      end
    end
  end

#   def update
#     respond_to do |format|
#       if @company.update(company_params)
#         format.html { redirect_to company_url(@company), notice: "company was successfully updated." }
#         format.json { render :show, status: :ok, location: @company }
#       else
#         format.html { render :edit, status: :unprocessable_entity }
#         format.json { render json: @company.errors, status: :unprocessable_entity }
#       end
#     end
#   end

#   # DELETE /companys/1 or /companys/1.json
#   def destroy
#     @company.destroy

#     respond_to do |format|
#       format.html { redirect_to companies_url, notice: "company was successfully destroyed." }
#       format.json { head :no_content }
#     end
#   end

  private
    def set_shop
      @shop = Shop.find(params[:id])
    end

    def shop_params
      params.require(:shop).permit(:name, :address, :rate, :memo)
    end
end
