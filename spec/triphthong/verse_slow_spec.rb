# encoding: UTF-8

require_relative '../spec_helper'

module Triphthong describe Verse do
  def pan_tadeusz_lines
    @pan_tadeusz_lines ||= File.read('spec/fixtures/pan-tadeusz.txt').lines.map(&:chomp).reject do |line|
      line.empty? or line.start_with? ' '
    end.map { |line| Verse.new line }
  end

  describe '#has_caesura_after?' do
    it 'works with Pan Tadeusz cæsuræ' do
      pan_tadeusz_lines.each do |line|
        assert line.has_caesura_after?(7), "no cæsura after 7th syllable in ‘#{line}’"
      end
    end
  end

  describe '#syllable_count' do
    it 'works with Pan Tadusz verses' do
      pan_tadeusz_lines.each do |line|
        line.syllable_count.must_equal 13, "not 13 syllables in ‘#{line}’"
      end
    end
  end
end end
