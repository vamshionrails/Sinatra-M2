
require File.expand_path('config/databases/mysql')

unless DB.table_exists? :categories
  DB.create_table :categories do
    primary_key :id
    varchar :name
    text :description
  end

  # populate the table
  DB[:categories].insert(:name => 'category1', :description => "category 1" )
  DB[:categories].insert(:name => 'category2', :description => "category 2")
  DB[:categories].insert(:name => 'category3', :description => "category 3")
end



unless DB.table_exists? :categories_products
  DB.create_table :categories_products do
    primary_key :id
    foreign_key :product_id, :products
    foreign_key :category_id, :categories
    text :description
  end

  # populate the table
  DB[:categories_products].insert(:product_id => '1', :category_id=> "2" )
  DB[:categories_products].insert(:product_id => '2', :category_id => "1")
end

module M2
  module Ecommerce
    class Category < Sequel::Model
       many_to_many :products
      def self.categories
        Category.all
      end
      def self.category(category_id)
        Category[category_id]
      end
    end
  end
end
