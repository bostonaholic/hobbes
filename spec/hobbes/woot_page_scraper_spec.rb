require 'spec_helper'

describe WootPageScraper do

  describe "scraping a woot subdomain page" do
    it "returns a woot page" do
      s = WootPageScraper.new('www')
      s.scrape.should be_a_kind_of(WootPage)
    end

    context "when scraping a wine.woot page" do
      let(:wine_woot_html) { File.open(File.expand_path(File.dirname(__FILE__) + "/../fixtures/wine.woot.html")) }

      describe "the returned WootPage" do
        it "has a fully constructed WootPage" do
          wps = WootPageScraper.new('wine')
          wps.stub(:pull_raw_html => wine_woot_html)
          wp = wps.scrape
          wp.subdomain.should == 'wine'
          wp.name.should == 'Ty Caton 2009 TyTanium - Two Pack'
          wp.price.should == "$69.99"
          wp.shipping_options.should include '$7.00 shipping'
        end
      end
    end

  end
end
