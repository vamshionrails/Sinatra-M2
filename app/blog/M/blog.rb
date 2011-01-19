
require File.expand_path('config/databases/mysql')

unless DB.table_exists? :posts
  DB.create_table :posts do
    primary_key :id
    varchar :name
    varchar :link
  end

  # populate the table
  DB[:posts].insert(:name => 'GitHub', :link => "http://github.com" )
  DB[:posts].insert(:name => 'Yahoo', :link => "http://yahoo.com")
  DB[:posts].insert(:name => 'Google', :link => "http://google.com")
end


module M2
  module Blog
    class Post < Sequel::Model
      def self.posts
        Post.all
      end
      def self.post(post_id)
        Post[post_id]
      end
    end
  end
end
