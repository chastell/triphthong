require_relative '../spec_helper'
require_relative '../../lib/triphthong/rhymer'
require_relative '../../lib/triphthong/verses'

module Triphthong describe Rhymer do
  describe '#rhyme' do
    it 'returns a poem matching the given syllable lengths' do
      verses = fake :verses
      random = Random.new 1981
      stub(verses).rhymed(length: 5) do
        ['haikus are easy', 'refrigerator'].sample random: random
      end
      stub(verses).rhymed(length: 7) { 'but sometimes they don’t make sense' }
      poem = Rhymer.new.rhyme lengths: '5-7-5', rhymes: 'ABC', verses: verses
      poem.must_equal <<-end.dedent.strip
        haikus are easy
        but sometimes they don’t make sense
        refrigerator
      end
    end
  end
end end
