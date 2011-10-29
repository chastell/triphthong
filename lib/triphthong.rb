# encoding: UTF-8

class Triphthong

  def initialize text
    @text = text
  end

  def syllable_count
    @text.scan(/\bau|a(?!u[flz])|à|ą|æ|e(?!u[dt]|y)|é|ę|o|ó|Ó|u|y|i(?![aąioóu]|[eéę](?!nt))/i).size
  end

end
