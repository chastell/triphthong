require_relative '../spec_helper'
require_relative '../../lib/triphthong/settings'

module Triphthong
  describe Settings do
    describe '#lengths' do
      it 'returns the parsed -l or --lengths value' do
        Settings.new(%w(--lengths 5-7-5)).lengths.must_equal [5, 7, 5]
      end
    end

    describe '#rhymes' do
      it 'returns the parsed -r or --rhymes value' do
        Settings.new(%w(-r AABB)).rhymes.must_equal %w(A A B B)
        Settings.new(%w(--rhymes ABC)).rhymes.must_equal %w(A B C)
      end
    end
  end
end
