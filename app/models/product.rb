class Product < ActiveRecord::Base

  def self.process_hash_and_save hash
    return unless hash['products'].is_a? Array
    hash['products'].each { |product_hash| Product.find_or_create_by product_hash }
  end

end
