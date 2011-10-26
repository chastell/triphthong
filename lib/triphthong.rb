# encoding: UTF-8

module Triphthong

  def self.count_syllables string
    string.split(/\P{L}/).map do |word|
      case word
      when 'Baublis'    then 2
      when 'Pauzylipu'  then 4
      when 'familiant'  then 4
      when 'feudalny'   then 3
      when 'paulinowie' then 4
      when 'spolia'     then 3
      else word.scan(/^au|a|à|ą|e(?!y)|é|ę|o|ó|Ó|u|y|i(?![aąeéęoóu])/i).size
      end
    end.inject :+
  end

end
