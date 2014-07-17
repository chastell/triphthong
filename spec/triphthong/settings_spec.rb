require_relative '../spec_helper'
require_relative '../../lib/triphthong/settings'

module Triphthong describe Settings do
  describe '#lenghts' do
    it 'returns the parsed -l or --lenghts value' do
      Settings.new(%w(-l 7+6)).lenghts.must_equal '7+6'
      Settings.new(%w(--lenghts 5-7-5)).lenghts.must_equal '5-7-5'
    end
  end

  describe '#rhymes' do
    it 'returns the parsed -r or --rhymes value' do
      Settings.new(%w(-r AABB)).rhymes.must_equal 'AABB'
      Settings.new(%w(--rhymes ABC)).rhymes.must_equal 'ABC'
    end
  end
end end
