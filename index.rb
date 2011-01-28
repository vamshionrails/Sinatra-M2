

module M2
  class IndexApp < Sinatra::Base

    OPTIONS = {
        :ecommerce_products_url => '/ecommerce/products'
      }

    get '/' do
      "Index App"
    end
  end
end
