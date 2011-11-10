# encoding: UTF-8

module Triphthong class Verse < Struct.new :text, :source
  NonEIVovel = /a|ä|à|ą|æ|ë|é|ę|o|ö|ó|ô|u|ü|y/

  SyllableVowel = Regexp.union [
    /ae(?=q|re)/, /ae$/,
    /(?<=et)a(?=i)/, /(?<=t)ai(?=n)/,
    /(?<!^[nz])au(?!cz|ł|k)/, /(?<=k)au(?=cz|k)/,
    /(?<!el|ni)eau/,
    /e(?=usz)/, /^e(?=unu)/, /(?<=f|z)e(?=um)/, /(?<=n)e(?=utr)/, /(?<=ni)e(?=u)/, /e(?=ucz)/, /(?<=s)e(?=ul)/, /eu/,
    /ey/,
    /e/,
    /ii$/,
    /i(?!e(?!nt)|#{NonEIVovel})/,
    /foi$/,
    /(?<=n)ou(?=v)/, /(?<=v)ou(?=s)/,
    /oy/,
    /(?<=q)uo/,
    /qui/,
    NonEIVovel,
  ]

  def has_caesura_after? number
    sum = 0
    word_counts.take_while { |c| sum += c; sum < number }
    sum == number
  end

  def rhyme_pattern
    all = words.join
    all[all.rindex(SyllableVowel, all.rindex(SyllableVowel) - 1)..-1]
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
    word_counts.inject :+
  end

  alias to_s text

  protected

  def words
    @words ||= Unicode.downcase(text).split /\P{L}/
  end

  private

  def word_counts
    @word_counts ||= words.map { |word| word.scan(SyllableVowel).size }
  end
end end
