# encoding: UTF-8

require 'unicode'

class Triphthong

  SyllableVowel = Regexp.union [
    /(?<!^[nz]|\P{L}[nz])au(?!cz|ł|k)/,
    /(?<!ni|s)eu(?!cz|l|m$|sz|tr)/,
    /ii\b/,
    /qui/,
    /e(?!y)/,
    /i(?![aąéęoóu]|e(?!nt))/,
    /a|à|ą|æ|é|ę|o|ó|u|ü|y/,
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
