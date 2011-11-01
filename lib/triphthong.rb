# encoding: UTF-8

class Triphthong

  SyllableVowels = /(?<!^[nz]|\P{L}[nz])au(?!cz|ł|k)|a|à|ą|æ|e(?!u[dt]|y)|é|ę|o|ó|Ó|u|ü|y|i(?![aąioóu]|[eéę](?!nt))/

  def initialize text
    @text = text.downcase.gsub /[^\p{L} ]/, ''
  end

  def syllable_count
    @text.scan(SyllableVowels).size
  end

  def syllables
    split = @text.split SyllableVowels
    scan  = @text.scan  SyllableVowels

    syls = []
    syls << "#{split.shift}#{scan.shift}".strip until split.empty? && scan.empty?
    syls[syls.size - 2] << syls.pop unless syls.last =~ SyllableVowels

    syls
  end

end
