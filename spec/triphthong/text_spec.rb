# encoding: UTF-8

require_relative '../spec_helper'

module Triphthong describe Text do
  describe '#sentences' do
    it 'yields consecutive stentences from the given text' do
      text = 'Litwo! Ojczyzno moja! ty jesteś jak zdrowie!'.extend Text
      text.sentences.to_a.must_equal ['Litwo! ', 'Ojczyzno moja! ', 'ty jesteś jak zdrowie!']
    end
  end
end end
