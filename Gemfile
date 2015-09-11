#--
# Copyright (c) 2015 Translation Exchange Inc. http://translationexchange.com
#
#  _______                  _       _   _             ______          _
# |__   __|                | |     | | (_)           |  ____|        | |
#    | |_ __ __ _ _ __  ___| | __ _| |_ _  ___  _ __ | |__  __  _____| |__   __ _ _ __   __ _  ___
#    | | '__/ _` | '_ \/ __| |/ _` | __| |/ _ \| '_ \|  __| \ \/ / __| '_ \ / _` | '_ \ / _` |/ _ \
#    | | | | (_| | | | \__ \ | (_| | |_| | (_) | | | | |____ >  < (__| | | | (_| | | | | (_| |  __/
#    |_|_|  \__,_|_| |_|___/_|\__,_|\__|_|\___/|_| |_|______/_/\_\___|_| |_|\__,_|_| |_|\__, |\___|
#                                                                                        __/ |
#                                                                                       |___/
# Permission is hereby granted, free of charge, to any person obtaining
# a copy of this software and associated documentation files (the
# "Software"), to deal in the Software without restriction, including
# without limitation the rights to use, copy, modify, merge, publish,
# distribute, sublicense, and/or sell copies of the Software, and to
# permit persons to whom the Software is furnished to do so, subject to
# the following conditions:
#
# The above copyright notice and this permission notice shall be
# included in all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
# EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
# MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
# NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
# LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
# OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
# WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
#++

source 'http://rubygems.org'

Encoding.default_external = Encoding::UTF_8
Encoding.default_internal = Encoding::UTF_8

gemspec

gem 'bundler'
gem 'puma', '~> 2.10'
gem 'unicorn', '~> 4.8'
gem 'dalli', '~> 2.7'

# gem 'redis'
gem 'rails', '~> 4.2'

gem 'rake', '~> 10.3'
gem 'rdoc', '~> 4.1'

# gem 'tml', '~> 5.1'
gem 'tml', :git => 'git://github.com/translationexchange/tml-ruby.git'
# gem 'tml', :path => '../tml-ruby'

gem 'coveralls', '~> 0.7', require: false

group :development, :test do
  gem 'sqlite3'
  gem 'rspec', '~> 3.1'
  gem 'rspec-core', '~> 3.1'
  gem 'rspec-mocks', '~> 3.1'
  gem 'rspec-rails', '~> 3.1'
  gem 'simplecov', '~> 0.9', :require => false
  gem 'simplecov-html', '~> 0.8', :require => false
end

group :assets do
  gem 'sass-rails'
end

gem 'redis-store'
gem 'redis-rails'
gem 'redis'