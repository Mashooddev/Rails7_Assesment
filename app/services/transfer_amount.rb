class TransferAmount < ApplicationService
  def initialize(type, *args)
    @type = type
    @merchant = args[0]
    @transaction = args[1]
  end

  def call
    if @type.eql?("ChargeTransaction")
      @merchant.total_transaction_sum += @transaction.amount
      @merchant.update!(total_transaction_sum: @merchant.total_transaction_sum)

    elsif @type.eql?("RefundTransaction")
      @merchant.total_transaction_sum -= @transaction.amount
      @merchant.update!(total_transaction_sum: @merchant.total_transaction_sum)
    end
  end
end