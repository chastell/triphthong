require_relative '../spec_helper'
require_relative '../../lib/triphthong/rhymer'
require_relative '../../lib/triphthong/verse_store'

module Triphthong describe Rhymer do
  describe '#rhyme' do
    it 'returns a poem matching the given syllable lengths' do
      verse_store = fake :verse_store
      random      = Random.new 1981
      stub(verse_store).rhymed(length: 5) do
        ['haikus are easy', 'refrigerator'].sample random: random
      end
      stub(verse_store).rhymed(length: 7) do
        'but sometimes they don’t make sense'
      end
      poem = Rhymer.new.rhyme lengths: '5-7-5', rhymes: 'ABC',
                              verse_store: verse_store
      poem.must_equal <<-end.dedent.strip
        haikus are easy
        but sometimes they don’t make sense
        refrigerator
      end
    end
  end
end end
