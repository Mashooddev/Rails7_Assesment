class UpdateTransaction < ApplicationService
  def initialize(transaction, *args)
    @type = args[0]
    @transaction = transaction
    @transaction_params = args[1]
  end

  def call
    @transaction.type = @type
    @transaction.update!(@transaction_params)
  end
end