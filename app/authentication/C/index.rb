
module M2
  class AuthenticationApp < Sinatra::Base

      register Sinatra::HTMLHelper
      register Sinatra::Authentication
      set :views, (File.expand_path ".") + "/app/authentication/V"



  end
end

