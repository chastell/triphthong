require_relative '../spec_helper'

module Triphthong describe CLIRhymer do
  describe '#run' do
    it 'parses the arguments and passes them to the rhymer' do
      rhymer = fake :rhymer, as: :class
      CLIRhymer.new(%w[--lenghts 7+6 --rhymes AABB], rhymer: rhymer).run
      rhymer.must_have_received :rhyme, [{ lenghts: '7+6', rhymes: 'AABB' }]
    end
  end
end end
