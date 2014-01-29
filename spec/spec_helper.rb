require 'minitest/autorun'
require 'minitest/pride'
require 'bogus/minitest/spec'
require 'triphthong'

Bogus.configure { |config| config.search_modules << Triphthong }
