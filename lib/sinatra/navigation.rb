require 'sinatra/base'
module Sinatra

  module Navigation
    def self.registered(app)
      app.helpers ::Navigation::Helpers
    end
  end

  ::Navigation.register
  helpers ::Navigation::Helpers
end
