# encoding: UTF-8

module Triphthong

  def self.count_syllables string
    string.scan(/\bau|a|ą|e|é|ę|o|ó|Ó|u|y|i(?![aąeéęoóu])/i).size
  end

end
