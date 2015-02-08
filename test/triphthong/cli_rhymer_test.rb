require_relative '../test_helper'
require_relative '../../lib/triphthong/cli_rhymer'

module Triphthong
  describe CLIRhymer do
    describe '#run' do
      it 'prints what the rhymer returns' do
        rhymer = fake(:rhymer, as: :class)
        stub(rhymer).poem(lengths: [5, 7, 5], rhymes: %w(A B C)) { "poem\n" }
        lambda do
          CLIRhymer.new(%w(--lengths 5-7-5 --rhymes ABC), rhymer: rhymer).run
        end.must_output "poem\n"
      end
    end
  end
end
