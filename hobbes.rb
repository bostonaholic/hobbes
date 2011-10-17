require 'sinatra/base'
require 'hobbes/woot_page_scraper'

module Hobbes
  class Application < Sinatra::Base
    get '/', :provides => 'json' do
      all_woots.to_json
    end

    get '/:subdomain', :provides => 'json' do |subdomain|
      one_woot(subdomain).to_json
    end

    protected
    def all_woots
      %w[www wine shirt sellout kids].collect do |subdomain|
       one_woot(subdomain)
      end
    end

    def one_woot(subdomain)
      WootPageScraper.new(subdomain).scrape.as_json
    end
  end
end
