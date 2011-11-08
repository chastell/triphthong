# encoding: UTF-8

module Triphthong module Verse
  NonEIYVovel = /a|ä|à|ą|æ|ë|é|ę|o|ö|ó|ô|u|ü/

  SyllableVowel = Regexp.union [
    /(?<=et)a(?=i)/,
    /(?<=t)ai(?=n)/,
    /(?<!el|ni)eau/,
    /(?<=n)ou(?=v)/,
    /(?<!^[nz]|\P{L}[nz])au(?!cz|ł|k)/,
    /(?<=k)au(?=cz|k)/,
    /e(?=usz)/,
    /\be(?=unu)/,
    /(?<=f|z)e(?=um)/,
    /(?<=n)e(?=utr)/,
    /(?<=ni)e(?=u)/,
    /e(?=ucz)/,
    /(?<=s)e(?=ul)/,
    /eu/,
    /e/,
    /(?<=v)ou(?=s)/,
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
