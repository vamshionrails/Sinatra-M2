require "rss"

%w"0.91 1.0 2.0 atom".each do |version|
  begin
    # avoid NoMethodError: undefined method `make' for nil:NilClass
    next unless RSS::Maker::MAKERS.include?(version)
    rss = RSS::Maker.make(version) do |maker|
      maker.channel.about = "http://example.com/index.rss"
      maker.channel.title = "Example"
      maker.channel.description = "Example Site"
      maker.channel.link = "http://example.com/"

      case version
      when "0.91"
        maker.channel.language = "ja"
      when "atom"
        # avoid NoMethodError: undefined method `author=' for #<RSS::Maker::RSS09::Channel:...>
        maker.channel.author = "Bob"
        maker.channel.date = Time.now
      end

      maker.items.do_sort = true

      maker.items.new_item do |item|
        item.link = "http://example.com/article.html"
        item.title = "Sample Article"
        item.date = Time.parse("2004/11/1 10:10")
      end

      maker.items.new_item do |item|
        item.link = "http://example.com/article2.html"
        item.title = "Sample Article2"
        item.date = Time.parse("2004/11/2 10:10")
      end
    end
    rss.to_s # TODO: write to file
    STDERR.puts "OK: #{version}"
  rescue
    STDERR.puts "NG: #{version}: #{$!}"
  end
end

