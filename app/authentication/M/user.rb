
require File.expand_path('config/databases/mysql')

unless DB.table_exists? :users
  DB.create_table :users do
    primary_key :id
    String :name
    String :login, :null => false
    String :email, :unique => true, :null => false
    String :crypted_password, :null => false
    String :password_salt, :null => false
    String :persistence_token, :null => false
    String :single_access_token, :null => false
    String :perishable_token, :null => false
    String :hashed_password
    Integer :login_count, :null => false, :default => 0
    Integer :failed_login_count, :null => false, :default => 0
    Date :last_request_at
    Date :current_login_at
    Date :last_login_at
    String :current_login_ip
    String :last_login_ip
    DateTime :created_at
    DateTime :updated_at
   end



end


module M2
  module User
    class User < Sequel::Model
      include Sinatra::Authentication
      def self.users
        User.all
      end
      def get_by_email(email)
        first(:email => email)
      end

    end
  end
end
