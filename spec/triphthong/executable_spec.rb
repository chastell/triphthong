# encoding: UTF-8

require_relative '../spec_helper'

module Triphthong describe Executable do
  describe '.new' do
    it 'validates --structure’s structure' do
      error = '--structure must be of the form m+n (where m and n are numbers)'
      -> { Executable.new ['build-db', '-s', '1+2'] }
      capture_io { -> { Executable.new ['build-db', '-s', '1 + 2'] }.must_raise SystemExit }.last.must_include error
      capture_io { -> { Executable.new ['build-db', '-s', 'a+b']   }.must_raise SystemExit }.last.must_include error
      capture_io { -> { Executable.new ['build-db', '-s', '+1']    }.must_raise SystemExit }.last.must_include error
      capture_io { -> { Executable.new ['build-db', '-s', 'foo']   }.must_raise SystemExit }.last.must_include error
    end
  end

  describe '#run' do
    it 'creates structure- and rhyme-keyed Verse database' do
      file = Tempfile.new ''
      Executable.new(['build-db', '-d', file.path, '-s', '6+17', '-s', '9+13', 'spec/fixtures/pan-tadeusz.intro.txt']).run
      db = YAML::Store.new file.path
      db.transaction(true) do
        db['6+17']['acił'].must_equal [Verse.new('ty jesteś jak zdrowie: Ile cię trzeba cenić, ten tylko się dowie, Kto cię stracił.', 'pan-tadeusz.intro.txt')]
        db['9+13']['obie'].must_equal [Verse.new('Dziś piękność twą w całej ozdobie Widzę i opisuję, bo tęsknię po tobie.',            'pan-tadeusz.intro.txt')]
      end
    end

    it 'rhymes!' do
      stdout = capture_io { Executable.new(['rhyme', '-c', '400', '-d', 'spec/fixtures/db.yml', '-s', '7+6']).run }.first
      stdout.size.must_be :<=, 400
      stdout.count("\n").must_equal 4+1+4
    end
  end
end end
