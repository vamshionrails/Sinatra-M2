require 'sinatra/base'

module Sinatra
  module Authentication

    def login_required!
      if ! is_logged_in?
        redirect '/login'
      end
    end

    def is_logged_in?
      @active_user != nil
    end

    def active_user
      return @active_user
    end


  end
  register Authentication

end
