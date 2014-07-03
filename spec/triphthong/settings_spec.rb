require_relative '../spec_helper'
require_relative '../../lib/triphthong/settings'

module Triphthong describe Settings do
  describe '#lenghts' do
    it 'returns the parsed -l or --lenghts value' do
      Settings.new(%w(-l 7+6)).lenghts.must_equal        '7+6'
      Settings.new(%w(--lenghts 7+6)).lenghts.must_equal '7+6'
    end
  end
end end
