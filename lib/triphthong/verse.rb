# encoding: UTF-8

module Triphthong module Verse
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

  def has_caesura_after? number
    counts = verse_text.split(/\P{L}/).map { |word| word.extend(Verse).syllable_count }
    sum = 0
    sum += counts.shift while sum < number and counts.any?
    sum == number
  end

  def rhyme_pattern
    verse_text[verse_text.rindex(SyllableVowel, verse_text.rindex(SyllableVowel) - 1)..-1]
  end

  def syllable_count
    verse_text.scan(SyllableVowel).size
  end

  private

  def verse_text
    @verse_text ||= Unicode.downcase(self).gsub /[^\p{L} -]/, ''
  end
end end