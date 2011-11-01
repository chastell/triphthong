# encoding: UTF-8

require 'unicode'

class Triphthong

  NonEIYVovel = /a|à|ą|æ|é|ę|o|ó|u|ü/

  SyllableVowel = Regexp.union [
    /(?<!^[nz]|\P{L}[nz])au(?!cz|ł|k)/,
    /(?<!ni|s)eu(?!cz|l|m$|sz|tr)/,
    /e/,
    /ii\b/,
    /i(?!e(?!nt)|#{NonEIYVovel})/,
    /qui/,
    /(?<!e)y/,
    NonEIYVovel,
  ]

  def initialize text
    @text = Unicode.downcase(text).gsub /[^\p{L} ]/, ''
  end

  def syllable_count
    @text.scan(SyllableVowel).size
  end

  def syllables
    split = @text.split SyllableVowel
    scan  = @text.scan  SyllableVowel

    syls = []
    syls << "#{split.shift}#{scan.shift}".strip until split.empty? && scan.empty?
    syls[syls.size - 2] << syls.pop unless syls.last =~ SyllableVowel

    syls
  end

end
