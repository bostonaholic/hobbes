# Hobbes

A simple REST service to gather product info from woot! and its subdomains.

Hosted on Heroku - http://deep-mist-953.heroku.com

###### Usage

1. output is in JSON
2. visiting deep-mist-953.heroku.com will give you the product infos for the current day for all subdomains of woot!
   * www.woot.com
   * wine.woot.com
   * shirt.woot.com
   * sellout.woot.com
   * kids.woot.com
3. appending the subdomain of the site of your choice will give you only the product info for that subdomain
   * http://deep-mist-953.heroku.com/wine
