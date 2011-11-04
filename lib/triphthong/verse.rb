# encoding: UTF-8

module Triphthong class Verse
  NonEIYVovel = /a|ä|à|ą|æ|ë|é|ę|o|ö|ó|u|ü/

  SyllableVowel = Regexp.union [
    /(?<!^[nz]|\P{L}[nz])au(?!cz|ł|k)/,
    /(?<=k)au(?=cz|k)/,
    /(?<!ni|s)eu(?!cz|l|m\b|sz|tr)/,
    /e/,
    /ii\b/,
    /i(?!e(?!nt)|#{NonEIYVovel})/,
    /qui/,
    /(?<!e)y/,
    NonEIYVovel,
  ]

  def initialize text
    @text = Unicode.downcase(text).gsub /[^\p{L} -]/, ''
  end

  def has_caesura_after? number
    counts = @text.split(/\P{L}/).map { |word| Verse.new(word).syllable_count }
    sum = 0
    sum += counts.shift while sum < number and counts.any?
    sum == number
  end

  def rhyme_pattern
    @text[@text.rindex(SyllableVowel, @text.rindex(SyllableVowel) - 1)..-1]
  end

  def syllable_count
    @text.scan(SyllableVowel).size
  end
end end
