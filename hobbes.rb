require 'sinatra'
require 'open-uri'
require 'nokogiri'
require 'json'

get '/', :provides => 'json' do
  doc = scrape_woot('www')
  @item = {:name => get_item_name(doc),
            :price => get_item_price(doc),
            :shipping_options => get_item_shipping_options(doc)}

  @item.to_json
end

get '/:subdomain', :provides => 'json' do |subdomain|
  doc = scrape_woot(subdomain)
  @item = {:name => get_item_name(doc),
            :price => get_item_price(doc),
            :shipping_options => get_item_shipping_options(doc)}

  @item.to_json
end

def scrape_woot(subdomain)
  uri = "http://#{subdomain}.woot.com"
  Nokogiri::HTML(open(uri))
end

def get_item_name(doc)
  doc.css('h2.fn').first.content rescue 'N/A'
end

def get_item_price(doc)
  doc.css('h3.price').first.content rescue 0.00
end

def get_item_shipping_options(doc)
  shipping_options = Array.new
  doc.css('#shippingOptions li').each do |shipping_option|
    shipping_options << shipping_option.content
  end

  shipping_options
end
