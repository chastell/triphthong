# encoding: UTF-8

module Triphthong class Verse < Struct.new :text, :source
  NonEIYVovel = /a|ä|à|ą|æ|ë|é|ę|o|ö|ó|ô|u|ü/

  SyllableVowel = Regexp.union [
    /foi\b/,
    /ae(?=q|re)/,
    /ae\b/,
    /(?<=q)uo/,
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
    /(?<!e|o)y/,
    NonEIYVovel,
  ]

  def has_caesura_after? number
    counts = word_syllable_counts
    sum = 0
    sum += counts.shift while sum < number and counts.any?
    sum == number
  end

  def rhyme_pattern
    normalised[normalised.rindex(SyllableVowel, normalised.rindex(SyllableVowel) - 1)..-1]
  end

  def rhymes_with? other
    return false if rhyme_pattern != other.rhyme_pattern
    return false if words.last == other.words.last
    return false if words.last.end_with? other.words.last
    return false if other.words.last.end_with? words.last
    true
  end

  def size
    text.size
  end

  def syllable_count
    word_syllable_counts.inject :+
  end

  alias to_s text

  protected

  def words
    normalised.split /\P{L}/
  end

  private

  def normalised
    @normalised ||= Unicode.downcase(text).gsub /[^\p{L} -]/, ''
  end

  def word_syllable_counts
    words.map { |word| word.scan(SyllableVowel).size }
  end
end end
