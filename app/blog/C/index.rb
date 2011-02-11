
module M2
  class BlogApp < Sinatra::Base

      register Sinatra::HTMLHelper
      register Sinatra::SRSS
      register Sinatra::SATOM
      set :views, (File.expand_path ".") + "/app/blog/V"

    get '/blog' do
      @data = M2::Blog::Post.posts
      #erb :index, { :layout => :'blog_layout'}
      partial :'index.erb'
    end
    
    get '/rss.atom' do
      @posts = M2::Blog::Post.posts
      builder do |xml|
        xml.instruct! :xml, :version => '1.0'
        xml.rss :version => "2.0" do
          xml.channel do
            xml.title "Liftoff News"
            xml.description "Liftoff to Space Exploration."
            xml.link "http://liftoff.msfc.nasa.gov/"

            @posts.each do |post|
              xml.item do
                xml.title  ""
                xml.link " "
                xml.description "post.body"
                xml.pubDate Time.now
                xml.guid "http://liftoff.msfc.nasa.gov/posts/#{post.id}"
              end
            end
          end
        end
      end
    end
    
    
    

    get '/blog/posts' do
      redirect '/blog'
    end

    get '/blog/posts/:id' do |id|
      @post = M2::Blog::Post.post(id)
      erb :post, { :layout => :'blog_layout'}
    end
    get '/blog/rss' do |id|
      run("http://www.simplyhired.com/a/jobs/list/q-ruby")
    end
  end
end

