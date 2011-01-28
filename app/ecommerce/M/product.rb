
require File.expand_path('config/databases/mysql')

unless DB.table_exists? :products
  DB.create_table :products do
    primary_key :id
    varchar :name
    text :description

  end

  # populate the table
  DB[:products].insert(:name => 'GitHub', :description => "product 1" )
  DB[:products].insert(:name => 'Yahoo', :description => "product 2")
  DB[:products].insert(:name => 'Google', :description => "product 3")
end

module M2
  module Ecommerce
    class Product < Sequel::Model
      many_to_many :categories
      def self.products
        Product.all
      end
      def self.product(product_id)
        Product[product_id]
      end

    end
  end
end
