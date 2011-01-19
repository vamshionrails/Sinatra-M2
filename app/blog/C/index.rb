
module M2
  class BlogApp < Sinatra::Base

    set :views, (File.expand_path ".") + "/app/blog/V"

    get '/blog' do
      @data = M2::Blog::Post.posts
      erb :index
    end

    get '/blog/posts' do
      redirect '/blog'
    end

    get '/blog/posts/:id' do |id|
      @post = M2::Blog::Post.post(id)
      erb :post
    end



helpers do

def link_to(url,text=url,opts={})
  attributes = ""
  opts.each { |key,value| attributes << key.to_s << "=\"" << value << "\" "}
  "<a href=\"#{url}\" #{attributes}>#{text}</a>"
end

end



  end
end

