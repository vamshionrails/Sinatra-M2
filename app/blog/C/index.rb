
module M2
  class BlogApp < Sinatra::Base

      register Sinatra::HTMLHelper
      set :views, (File.expand_path ".") + "/app/blog/V"

    get '/blog' do
      @data = M2::Blog::Post.posts
      erb :index, { :layout => :'blog_layout'}
    end

    get '/blog/posts' do
      redirect '/blog'
    end

    get '/blog/posts/:id' do |id|
      @post = M2::Blog::Post.post(id)
      erb :post, { :layout => :'blog_layout'}
    end

  end
end

