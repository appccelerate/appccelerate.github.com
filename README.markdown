Website for appccelerate.com. Please also see LICENSE file.

Notes for maintainers
=====================

The main navigation content is in _config.yml. Further information about how to structure elements can be found in it.

Images for individual sites must be placed into img/content.
Plugins and external components must be place into plugins/


How to run the site locally during development
==============================================

1. Install ruby
2. Install ruby dev kit http://rubyinstaller.org/downloads/, extract to some path, change to path in console
3. <code>ruby dk.rb init</code>
4. <code>ruby dk.rb install</code>
5. <code>gem install jekyll</code>
6. cd to the website fork on your hard drive, type <code>jekyll serve</code>
7. open browser in <code>http://localhost:4000</code>
