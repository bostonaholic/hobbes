# Hobbes

A simple REST service to gather product info from woot! and its subdomains.

Hosted on Heroku - http://hobbes.heroku.com

## Usage:Production

1. output is in JSON
2. visiting http://hobbes.heroku.com will give you the product infos for the current day for all subdomains of woot!
   * [www.woot.com](www.woot.com)
   * [wine.woot.com](wine.woot.com)
   * [shirt.woot.com](shirt.woot.com)
   * [sellout.woot.com](sellout.woot.com)
   * [kids.woot.com](kids.woot.com)
3. appending the subdomain of the site of your choice will give you only the product info for that subdomain
   * http://hobbes.heroku.com/wine
   * etc.

## Usage:Development

create a directory to store the project

`$ mkdir hobbes`

`$ cd hobbes`

clone it

`$ git clone git@github.com:bostonaholic/hobbes.git`

install any missing bundles

`$ bundle install`

start up the sinatra server

`$ ruby -rubygems hobbes.rb`

visit http://localhost:4567

enjoy!
