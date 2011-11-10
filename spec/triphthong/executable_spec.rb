# encoding: UTF-8

require_relative '../spec_helper'

module Triphthong describe Executable do
  describe '.new' do
    it 'validates --structure’s structure' do
      error = '--structure must be of the form m+n (where m and n are numbers)'
      -> { Executable.new ['prepare', '-s', '1+2'] }
      capture_io { -> { Executable.new ['prepare', '-s', '1 + 2'] }.must_raise SystemExit }.last.must_include error
      capture_io { -> { Executable.new ['prepare', '-s', 'a+b']   }.must_raise SystemExit }.last.must_include error
      capture_io { -> { Executable.new ['prepare', '-s', '+1']    }.must_raise SystemExit }.last.must_include error
      capture_io { -> { Executable.new ['prepare', '-s', 'foo']   }.must_raise SystemExit }.last.must_include error
    end
  end

  describe '#run' do
    it 'plucks sentences from the passed files' do
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

    it 'plucks only sentences with the given syllable structure' do
      Dir.mktmpdir do |tempdir|
        Executable.new(['prepare', '-d', tempdir, '-s', '3+2', 'spec/fixtures/pan-tadeusz.intro.txt']).run
        File.read("#{tempdir}/pan-tadeusz.intro.txt").must_equal <<-END.gsub /^\s*/, ''
          Ojczyzno moja!
        END
      end
      Dir.mktmpdir do |tempdir|
        Executable.new(['prepare', '-d', tempdir, '-s', '0+2', 'spec/fixtures/pan-tadeusz.intro.txt']).run
        File.read("#{tempdir}/pan-tadeusz.intro.txt").must_equal <<-END.gsub /^\s*/, ''
          Litwo!
        END
      end
      Dir.mktmpdir do |tempdir|
        Executable.new(['prepare', '-d', tempdir, '-s', '5+0', 'spec/fixtures/pan-tadeusz.intro.txt']).run
        File.read("#{tempdir}/pan-tadeusz.intro.txt").must_equal <<-END.gsub /^\s*/, ''
          Ojczyzno moja!
        END
      end
    end
  end
end end
