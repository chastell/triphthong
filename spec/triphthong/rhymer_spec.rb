require_relative '../spec_helper'
require_relative '../../lib/triphthong/rhymer'

module Triphthong describe Rhymer do
  describe '#rhyme' do
    it 'returns a poem matching the given syllable lengths and rhymes' do
      verses = {
        5 => ['haikus are easy', 'refrigerator'],
        7 => ['but sometimes they don’t make sense'],
      }
      poem = Rhymer.new.rhyme(lengths: '5-7-5', random: Random.new(2009),
                              rhymes: 'ABC', verses: verses)
      poem.must_equal <<-end.dedent.strip
        haikus are easy
        but sometimes they don’t make sense
        refrigerator
      end
    end
  end
end end
