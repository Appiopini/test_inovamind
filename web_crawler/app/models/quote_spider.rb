class Quote < ApplicationRecord

    @name = 'quotes_spider'
    @engine = :mechanize

    def self.process(url)
      @start_urls = [url]
      self.crawl!
    end

    def parse(response, url:, data: {})
      response.xpath("//<div [@class='quote']").each do |quote|
        item = {}

        item[:quote]      = quote.css('spam.text')&.text&.squish
        item[:author]      = quote.css('span.author')&.text&.squish
        item[:author_about] = quote.css('a.about')&.text&.squish
        item[:tag]      = quote.css('div.tag')&.text&.squish

        Quote.where(item).first_or_create
      end
    end
end
