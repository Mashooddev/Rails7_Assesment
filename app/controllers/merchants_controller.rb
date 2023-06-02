class MerchantsController < ApplicationController
  skip_before_action :authenticate_user, only: [:create]
  before_action :find_merchant, except: [:index, :new, :create]

  def index
    @merchants = Merchant.all
  end

  def create
    @merchant = Merchant.create!(merchant_params)

  rescue StandardError => e
    render json: {error: true, msg: e.message}
  end
  
  def show; end
  
  def update
    @merchant.update(merchant_params)

  rescue StandardError => e
    render json: {error: true, msg: e.message}
  end

  def destroy
    @merchant.destroy
    render json: {error: false, msg: "Successfuly deleted"}
    
  rescue StandardError => e
    render json: {error: true, msg: e.message}
  end

  private

  def merchant_params
    params.require(:merchant).permit(
      :email, 
      :name, 
      :description, 
      :status, 
      :total_transaction_sum
    )
  end

  def find_merchant
    debugger
    @merchant = Merchant.find(params[:id])

  rescue ActiveRecord::RecordNotFound
    render json: {error: true, msg: "Merchant not found"}
  end
end
