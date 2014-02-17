require_relative '../spec_helper'

module Triphthong describe Rhymer do
  describe '.rhyme' do
    it 'returns a poem matching the given syllable lenghts and rhymes' do
      rhymer = fake :rhymer, poem: "poem\n"
      poem   = Rhymer.rhyme lenghts: '7+6', rhymer: rhymer, rhymes: 'AABB'
      poem.must_equal "poem\n"
    end
  end
end end
