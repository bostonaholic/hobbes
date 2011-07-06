require 'sinatra'
require 'open-uri'
require 'nokogiri'

get '/' do
  doc = scrape_woot
  @item = {:name => get_item_name(doc),
            :price => get_item_price(doc),
            :shipping_options => get_item_shipping_options(doc)}

  "#{@item}"
end

def scrape_woot
  uri = 'http://www.woot.com'
  Nokogiri::HTML(open(uri))
end

def get_item_name(doc)
  doc.css('h2.fn').first.content
end

def get_item_price(doc)
  doc.css('h3.price').first.content
end

def get_item_shipping_options(doc)
  shipping_options = Array.new
  doc.css('#shippingOptions li').each do |shipping_option|
    shipping_options << shipping_option.content
  end

  shipping_options
end
