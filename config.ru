

%w(haml sinatra sinatra/base sequel erb  ).each  { |gem| require gem}

Dir.glob(%w( lib/**/*.rb configs/**/*.rb app/{index,blog,ecommerce,authentication}/[CM]/**/*.rb), &method(:load))
 

run Rack::Cascade.new [ M2::IndexApp, M2::BlogApp, M2::EcommerceApp, M2::AuthenticationApp]

set :public,   File.expand_path(File.dirname(__FILE__) + '/public')
 enable:static
