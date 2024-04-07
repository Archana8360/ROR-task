# lib/tasks/import_products.rake

require 'roo'

namespace :import do
  desc 'Import products from Excel file'
  task products: :environment do
    # Specify the path to your Excel file
    file_path = '/home/archana/Desktop/Product_data (1) (1).xlsx'

    # Initialize Excel workbook
    workbook = Roo::Excelx.new(file_path)

    # Iterate over each row in the Excel file
    workbook.each_with_index(name: 'product_name', amount: 'amount') do |row, index|
      next if index.zero? # Skip the header row

      # Extract product data from the current row
      product_name = row[:name]
      amount = row[:amount]

      # Check if a product with the same name already exists
      existing_product = Product.find_by(name: product_name)

      if existing_product
        puts "Skipping duplicate product: #{product_name}"
      else
        # Create a new product
        Product.create(name: product_name, amount: amount)
        puts "Product created: #{product_name}"
      end
    end
  end
end