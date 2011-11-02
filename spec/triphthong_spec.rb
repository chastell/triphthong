# encoding: UTF-8

require_relative 'spec_helper'

describe Triphthong do

  describe '#syllable_count' do

    it 'returns the number of syllables' do
      blacklist = ['fein', 'graniciebus', 'portefeuille'].map { |word| /\b#{Regexp.quote word}\b/i }
      File.read('spec/fixtures/pan-tadeusz.txt').lines.map(&:chomp).each do |line|
        next if line.empty? or line.start_with? ' ' or blacklist.any? { |match| line =~ match }
        Triphthong.new(line).syllable_count.must_equal 13, "not 13 syllables in ‘#{line}’"
      end
    end

    it 'handles edge cases' do
      {
        'Müller' => 2, 'Raphaël' => 3, 'Störch' => 1, 'Vorwärts' => 2,
        'Odyseusz' => 4, 'muzeum' => 3, 'neutralny' => 4, 'nieuczciwy' => 4, 'nieustraszony' => 5, 'przeuczony' => 4, 'reumatyzm' => 3, 'seulski' => 3, 'trofeum' => 3,
        'inauguracja' => 5, 'kauczuk' => 2, 'niezaułkowy' => 5, 'paranauka' => 5, 'zaułek' => 3,
        'quiz' => 1,
      }.each do |word, count|
        Triphthong.new("z #{word} z").syllable_count.must_equal count, "not #{count} syllables in ‘#{word}’"
      end
    end

  end

end
