require 'sinatra'
require 'open-uri'
require 'nokogiri'
require 'json'

get '/', :provides => 'json' do
  all_woots.to_json
end

get '/:subdomain', :provides => 'json' do |subdomain|
  scrape_and_build_item(subdomain).to_json
end

def all_woots
  %w[www wine shirt sellout kids].collect do |subdomain|
    scrape_and_build_item(subdomain)
  end
end

def scrape_and_build_item(subdomain)
  doc = scrape_woot(subdomain)
  build_item(subdomain, doc)
end

def build_item(subdomain, doc)
  {:subdomain => subdomain,
   :name => get_item_name(doc),
   :price => get_item_price(doc),
   :shipping_options => get_item_shipping_options(doc)}
end

def scrape_woot(subdomain = 'www')
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
    shipping_options << shipping_option.content.sub('+ ','').sub(' -or-', '')
  end

  shipping_options
end
