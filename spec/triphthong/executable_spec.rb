# encoding: UTF-8

require_relative '../spec_helper'

module Triphthong describe Executable do
  describe '#run' do
    it 'plucks 13-syllable sentences with a cæsura after the 7th sentence' do
      Dir.mktmpdir do |tempdir|
        Executable.new(['prepare', '-d', tempdir, 'spec/fixtures/pan-tadeusz.intro.txt']).run
        File.read("#{tempdir}/pan-tadeusz.intro.txt").must_equal <<-END.gsub /^\s*/, ''
          Litwo!
          Ojczyzno moja!
          ty jesteś jak zdrowie: Ile cię trzeba cenić, ten tylko się dowie, Kto cię stracił.
          Dziś piękność twą w całej ozdobie Widzę i opisuję, bo tęsknię po tobie.
        END
      end
    end
  end
end end
