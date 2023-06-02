json.error false

json.admins @admins do |admin|
  json.id @admin.id
  json.name admin.name
  json.email admin.email
end