require_relative '../test_helper'
require_relative '../../lib/triphthong/rhymer'
require_relative '../../lib/triphthong/verses'

module Triphthong
  describe Rhymer do
    describe '.call' do
      it 'returns a poem matching the given syllable lengths' do
        verses = fake(:verses)
        stub(verses).rhyme_map('A' => [5], 'B' => [7], 'C' => [5]) do
          { 'A' => 'easy', 'B' => 'sense', 'C' => 'rator' }
        end
        stub(verses).verse(length: 5, rhyme: 'easy')  { 'haikus are easy' }
        stub(verses).verse(length: 5, rhyme: 'rator') { 'refrigerator'    }
        stub(verses).verse(length: 7, rhyme: 'sense') do
          'but sometimes they don’t make sense'
        end
        poem = Rhymer.call(lengths: [5, 7, 5], rhymes: %w[A B C],
                           verses: verses)
        _(poem).must_equal <<-end.dedent
          haikus are easy
          but sometimes they don’t make sense
          refrigerator
        end
      end
    end
  end
end
