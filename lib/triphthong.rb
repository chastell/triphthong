# encoding: UTF-8

module Triphthong

  def self.count_syllables string
    string.split(/\P{L}/).map do |word|
      word.scan(/^au|a(?!u[flz])|à|ą|æ|e(?!u[dt]|y)|é|ę|o|ó|Ó|u|y|i(?![aąioóu]|[eéę](?!nt))/i).size
    end.inject :+
  end

end
