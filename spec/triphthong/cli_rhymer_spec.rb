require_relative '../spec_helper'
require_relative '../../lib/triphthong/cli_rhymer'

module Triphthong describe CLIRhymer do
  describe '#run' do
    it 'prints what the rhymer returns' do
      rhymer = fake :rhymer, as: :class
      stub(rhymer).rhyme(lenghts: '5-7-5', rhymes: 'ABC') { "poem\n" }
      lambda do
        CLIRhymer.new(%w(--lenghts 5-7-5 --rhymes ABC), rhymer: rhymer).run
      end.must_output "poem\n"
    end
  end
end end
