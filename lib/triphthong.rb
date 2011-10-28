# encoding: UTF-8

module Triphthong

  def self.count_syllables string
    string.split(/\P{L}/).map do |word|
      case word
      when 'laufer'
        2
      when 'aplauzem', 'feudalny', 'kaukaskich', 'klientów', 'teutoński', 'Tyzenhauz'
        3
      when 'Akademii', 'kokieterii', 'paulinowie', 'Tyzenhauzem'
        4
      else word.scan(/^au|a|à|ą|æ|e(?!y)|é|ę|o|ó|Ó|u|y|i(?![aąeéęoóu])/i).size
      end
    end.inject :+
  end

end
