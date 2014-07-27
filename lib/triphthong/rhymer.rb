require_relative 'verses'

module Triphthong class Rhymer
  def rhyme lengths: '', rhymes: '', verses: Verses.new
    lengths.split('-').map(&:to_i).map do |length|
      verses.rhymed(length: length)
    end.join "\n"
  end
end end
