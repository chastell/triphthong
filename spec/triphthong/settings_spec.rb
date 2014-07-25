require_relative '../spec_helper'
require_relative '../../lib/triphthong/settings'

module Triphthong describe Settings do
  describe '#lengths' do
    it 'returns the parsed -l or --lengths value' do
      Settings.new(%w(-l 7+6)).lengths.must_equal '7+6'
      Settings.new(%w(--lengths 5-7-5)).lengths.must_equal '5-7-5'
    end
  end

  describe '#rhymes' do
    it 'returns the parsed -r or --rhymes value' do
      Settings.new(%w(-r AABB)).rhymes.must_equal 'AABB'
      Settings.new(%w(--rhymes ABC)).rhymes.must_equal 'ABC'
    end
  end
end end
