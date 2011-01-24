

%w(haml sinatra sinatra/base sequel erb  ).each  { |gem| require gem}

Dir.glob(%w(*.rb  lib/**/*.rb configs/**/*.rb app/{blog,ecommerce}/[CM]/**/*.rb), &method(:load))

run Rack::Cascade.new [ M2::IndexApp, M2::BlogApp, M2::EcommerceApp]


