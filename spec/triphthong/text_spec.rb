# encoding: UTF-8

require_relative '../spec_helper'

module Triphthong describe Text do
  before do
    @text = File.read('spec/fixtures/pan-tadeusz.intro.txt').extend Text
  end

  describe '#sentences' do
    it 'returns an Enumerator' do
      @text.sentences.must_be_instance_of Enumerator
    end

    it 'yields consecutive stentences from the given text' do
      @text.sentences.to_a.must_equal [
        'Litwo!',
        'Ojczyzno moja!',
        'ty jesteś jak zdrowie: Ile cię trzeba cenić, ten tylko się dowie, Kto cię stracił.',
        'Dziś piękność twą w całej ozdobie Widzę i opisuję, bo tęsknię po tobie.',
      ]
    end
  end
end end
