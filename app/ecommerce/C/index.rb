
module M2
  class EcommerceApp < Sinatra::Base

    register Sinatra::HTMLHelper
    set :views, (File.expand_path ".") + "/app/ecommerce/V"

    get  '/ecommerce/categories' do
      @categories = M2::Ecommerce::Category.categories
      erb :categories
    end

    get  '/ecommerce/products' do
      @products = M2::Ecommerce::Product.products
      erb :index, { :layout => :'product_layout'}
    end

    get  '/ecommerce/product/:id' do |id|
      @product = M2::Ecommerce::Product.product(id)
      @product_categories = @product.categories
      erb :product, { :layout => :'product_layout'}
    end

  end
end



