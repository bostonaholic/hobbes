require 'json'

class WootPage
  attr_accessor :subdomain, :name, :price, :shipping_options

  def initialize(subdomain, name, price, shipping_options)
    self.subdomain = subdomain
    self.name = name
    self.price = price
    self.shipping_options = shipping_options
  end

  def as_json(*args, &block)
    {:subdomain        => subdomain,
     :name             => name,
     :price            => price,
     :shipping_options => shipping_options}
  end
end
