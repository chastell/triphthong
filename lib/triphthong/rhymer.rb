module Triphthong class Rhymer
  def rhyme lenghts: '', random: Random.new, rhymes: '', verses: {}
    lenghts.split('-').map(&:to_i).map do |syllable_count|
      verses[syllable_count].sample(random: random)
    end.join "\n"
  end
end end
