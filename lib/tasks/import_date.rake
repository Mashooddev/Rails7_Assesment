require 'csv'

namespace :import do
  desc "Import merchants and admins from CSV"
  task import_merchants_and_admins: :environment do
    file_path = '/home/hp/Downloads/file.csv'
    
    CSV.foreach(file_path, headers: true) do |row|
      if row['type'] == 'Merchant'
        create_merchant(row)
      elsif row['type'] == 'Admin'
        create_admin(row)
      else
        puts "Invalid row type: #{row['type']}"
      end
    end
  end

  def create_merchant(row)
    merchant = Merchant.new(
      name: row['name'],
      email: row['email'],
      description: row['description'],
      status: row['status'],
      total_transaction_sum: row['total_transaction_sum']
    )
    if merchant.save!
      puts "Merchant created: #{merchant.name}"
    else
      puts "Failed to create merchant: #{merchant.errors.full_messages}"
    end
  end

  def create_admin(row)
    admin = Admin.new(
      name: row['name'],
      email: row['email'],
      password: row['password'],
      password_confirmation: row['password_confirmation']
    )
    if admin.save!
      puts "Admin created: #{admin.name}"
    else
      puts "Failed to create admin: #{admin.errors.full_messages}"
    end
  end
end
