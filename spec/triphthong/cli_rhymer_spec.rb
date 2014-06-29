require_relative '../spec_helper'

module Triphthong describe CLIRhymer do
  describe '#run' do
    it 'parses the arguments and passes them to the rhymer' do
      rhymer = fake :rhymer, as: :class
      capture_io do
        CLIRhymer.new(%w(--lenghts 7+6 --rhymes AABB), rhymer: rhymer).run
      end
      rhymer.must_have_received :rhyme, [{ lenghts: '7+6', rhymes: 'AABB' }]
    end

    it 'prints what the rhymer returns' do
      rhymer = fake :rhymer, as: :class
      stub(rhymer).rhyme(lenghts: '5-7-5', rhymes: 'ABC') { "poem\n" }
      lambda do
        CLIRhymer.new(%w(--lenghts 5-7-5 --rhymes ABC), rhymer: rhymer).run
      end.must_output "poem\n"
    end
  end
end end
