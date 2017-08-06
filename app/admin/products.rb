ActiveAdmin.register Product do

  index do
    column :name
    column :brand
    column :model
    column :sku
    column :price, sortable: :price do |product|
      number_to_currency product.price
    end
    column :desc
  end

  collection_action :import_products, method: :get do
    
  end

  collection_action :upload_products, method: :put do
    file = File.read('products.json')
    products_hash = JSON.parse(file)
    Product.process_hash_and_save(products_hash)
    redirect_to collection_path, notice: "Products have been imported successfully!"
  end

end
