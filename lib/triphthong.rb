# encoding: UTF-8

class Triphthong

  SyllableVowels = /\bau|a(?!u[flz])|à|ą|æ|e(?!u[dt]|y)|é|ę|o|ó|Ó|u|ü|y|i(?![aąioóu]|[eéę](?!nt))/i

  def initialize text
    @text = text
  end

  def syllable_count
    @text.scan(SyllableVowels).size
  end

  def syllables
    text  = @text.downcase.split(//).grep(/[\p{L} ]/).join
    split = text.split SyllableVowels
    scan  = text.scan  SyllableVowels

    syls = []
    syls << "#{split.shift}#{scan.shift}".strip until split.empty? && scan.empty?
    syls[syls.size - 2] << syls.pop unless syls.last =~ SyllableVowels

    syls
  end

end
