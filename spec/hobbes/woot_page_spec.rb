require 'spec_helper'

describe WootPage do

  it "fully constructs" do
    w = WootPage.new('www','Item',10.00, ['so1','so2'])
    w.subdomain.should == 'www'
    w.name.should be == 'Item'
    w.price.should == 10.00
    w.shipping_options.should include 'so1'
    w.shipping_options.should include 'so2'
  end
end
