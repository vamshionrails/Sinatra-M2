

%w(haml sinatra sinatra/base sequel erb sinatra/navigation).each  { |gem| require gem}


register Sinatra::Navigation

Dir.glob(%w(*.rb configs/**/*.rb app/{blog}/[CM]/**/*.rb), &method(:load))
run Rack::Cascade.new [ M2::IndexApp, M2::BlogApp]
