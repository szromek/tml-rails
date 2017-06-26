# encoding: UTF-8
#--
# Copyright (c) 2016 Translation Exchange Inc. http://translationexchange.com
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

class Tml::CacheAdapters::Rails < Tml::Cache

  def initialize
    @cache = Rails.cache
  end

  def cache_name
    @cache.class.name
  end

  def read_only?
    false
  end

  def fetch(key, opts = {})
    miss = false
    data = @cache.fetch(versioned_key(key, opts)) do
      info("Cache miss: #{key}")
      miss = true
      if block_given?
        yield
      else
        nil
      end
    end
    info("Cache hit: #{key}") unless miss
    data
  rescue Exception => ex
    warn("Failed to retrieve data: #{ex.message}")
    return nil unless block_given?
    yield
  end

  def store(key, data, opts = {})
    if data.try(:[], 'version').to_i != 0
      info("Cache store: #{key}")
      @cache.write(versioned_key(key, opts), strip_extensions(data))
    else
      info("Cache store error: No data to store")
    end
    data
  rescue Exception => ex
    warn("Failed to store data: #{ex.message}")
    key
  end

  def delete(key, opts = {})
    info("Cache delete: #{key}")
    @cache.delete(versioned_key(key, opts))
    key
  rescue Exception => ex
    warn("Failed to delete data: #{ex.message}")
    key
  end

  def exist?(key, opts = {})
    data = @cache.fetch(versioned_key(key, opts))
    not data.nil?
  rescue Exception => ex
    warn("Failed to check if key exists: #{ex.message}")
    false
  end

  def clear(opts = {})
    info('Cache clear')
  rescue Exception => ex
    warn("Failed to clear cache: #{ex.message}")
  end

end
