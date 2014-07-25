module Triphthong class Rhymer
  def rhyme lengths: '', random: Random.new, rhymes: '', verses: {}
    lengths.split('-').map(&:to_i).map do |syllable_count|
      verses[syllable_count].sample(random: random)
    end.join "\n"
  end
end end
