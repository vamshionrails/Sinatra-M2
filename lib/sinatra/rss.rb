
require 'sinatra/base'
require 'rexml/document'
require 'net/http'
require 'rss/1.0'
require 'rss/2.0'
require 'open-uri'
require 'rss/maker'
 

require 'sinatra/base'

module Sinatra
  module SRSS
    def rss_version
      "RSS V.2.0"
    end
    def rss_generate
      version = "2.0"
      content = RSS::Maker.make(version) do |m|
        m.channel.title = "Title"
        m.channel.link ="http://localhost:4002"
        m.channel.description = "Description"
        i = m.items.new_item
        i.title = "RSS Feed"
        i.description = "Description of items"
        i.date = Time.now
      end	
    end
    
     
    
    def rss_run(url)
      xml = REXML::Document.new Net::HTTP.get(URI.parse(url))
      data = {
        :title    => xml.root.elements['channel/title'].text,
        :home_url => xml.root.elements['channel/link'].text,
        :rss_url  => url,
        :items    => []

      }
      xml.elements.each '//item' do |item|
        new_items = {} and item.elements.each do |e| 
          new_items[e.name.gsub(/^dc:(\w)/,"\1").to_sym] = e.text
        end
        data[:items] << new_items
      end
      data
    end
  end
  register SRSS
end

