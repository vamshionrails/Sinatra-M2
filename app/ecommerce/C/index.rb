
module M2
  class EcommerceApp < Sinatra::Base

      register Sinatra::HTMLHelper
      set :views, (File.expand_path ".") + "/app/ecommerce/V"


    get '/ecommerce'  do
      @data = M2::Ecommerce::Product.products
      erb :index, { :layout => :'product_layout'}
    end

    get '/ecommerce/catalog' do
      redirect '/ecommerce'
    end

    get  '/ecommerce/products'
      @products = M2::Ecommerce::Product.products
      erb :index, { :layout => :'product_layout'}

    end

    get '/ecommerce/categories' do
      @categories = M2::Ecommerce::Category.categories
      erb :categories, { :layout => :'product_layout'}
    end

  end


