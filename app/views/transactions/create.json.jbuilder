json.error false

json.transaction do
  json.id @transaction.id
  json.amount @transaction.amount
  json.status @transaction.status
  json.customer_email @transaction.customer_email
  json.customer_phone @transaction.customer_phone
  json.merchant_id @transaction.merchant_id
  json.type @transaction.type
end