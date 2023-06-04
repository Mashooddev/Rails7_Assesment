class TransactionsController < ApplicationController
  before_action :find_merchant
  before_action :find_transaction, only: [:show, :update, :destroy]

  def index
    @transactions = @merchant.transactions
  end

  def create
    @transaction = AuthorizeTransaction.new(transaction_params)
    @transaction.merchant = @merchant
    @transaction.save!

  rescue StandardError => e
    render json: {error: true, msg: e.message}
  end
  
  def show; end
  
  def update
    type = params["transaction"][:type]

    UpdateTransaction.call(@transaction, type, transaction_params)
    TransferAmount.call(type, @merchant, @transaction)

  rescue StandardError => e
    render json: {error: true, msg: e.message}
  end

  def destroy
    @transaction.destroy
    render json: {error: false, msg: "Successfuly deleted"}
    
  rescue StandardError => e
    render json: {error: true, msg: e.message}
  end

  private

  def transaction_params
    params.require(:transaction).permit(
      :amount,
      :status,
      :customer_email,
      :customer_phone,
    )
  end

  def find_merchant
    @merchant = Merchant.find(params[:merchant_id])

  rescue ActiveRecord::RecordNotFound
    render json: {error: true, msg: "Merchant not found"}
  end

  def find_transaction
    @transaction = @merchant.transactions.find(params[:id])

  rescue ActiveRecord::RecordNotFound
    render json: {error: true, msg: "Transaction not found"}
  end
end
