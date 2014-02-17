module Triphthong class Rhymer
  def self.rhyme lenghts: '', rhymer: nil, rhymes: ''
    rhymer ||= new lenghts: lenghts, rhymes: rhymes
    rhymer.poem
  end

  def initialize lenghts: '', rhymes: ''
  end

  def poem
  end
end end
