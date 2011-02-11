
module M2
  class IndexApp < Sinatra::Base
      register Sinatra::SRSS
      
      
    OPTIONS = {
      :ecommerce_products_url => '/ecommerce/products'
    }

    get '/' do
      "Index App"

    end
    get '/rss' do
      #"#{rss_run('http://www.simplyhired.com/a/job-feed/rss/q-ruby')}"
      "#{rss_generate}"
    end
    
    
    
    
    

  end
end
