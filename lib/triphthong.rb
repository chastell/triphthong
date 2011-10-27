# encoding: UTF-8

module Triphthong

  def self.count_syllables string
    string.split(/\P{L}/).map do |word|
      case word
      when 'fein'
        1
      when 'Baublis', 'laufer'
        2
      when 'aplauzem', 'feudalny', 'kaukaskich', 'klientów', 'quibusdam', 'spolia', 'teutoński', 'Tyzenhauz', 'Zofio'
        3
      when 'Akademii', 'familiant', 'harmonią', 'kokieterii', 'Orientis', 'paulinowie', 'Pauzylipu', 'Tyzenhauzem'
        4
      when 'graniciebus'
        5
      else word.scan(/^au|a|à|ą|e(?!y)|é|ę|o|ó|Ó|u|y|i(?![aąeéęoóu])/i).size
      end
    end.inject :+
  end

end
