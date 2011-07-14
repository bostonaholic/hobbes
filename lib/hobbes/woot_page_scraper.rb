require 'open-uri'
require 'nokogiri'
require 'hobbes/woot_page'

class WootPageScraper
  attr_accessor :subdomain

  def initialize(subdomain)
    self.subdomain = subdomain
  end

  def scrape
    doc = Nokogiri::HTML(pull_raw_html)
    WootPage.new(subdomain,get_item_name(doc),get_item_price(doc),get_item_shipping_options(doc))
  end

  protected
  def pull_raw_html
    uri = "http://#{subdomain}.woot.com"
    open(uri)
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
end
