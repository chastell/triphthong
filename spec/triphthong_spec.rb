# encoding: UTF-8

require_relative 'spec_helper'

describe Triphthong do

  describe '#has_caesura_after?' do

    it 'returns a Boolean on whether the given String has a cæsura after the given syllable' do
      refute Triphthong.new('Litwo! Ojczyzno moja! ty jesteś jak zdrowie!').has_caesura_after? 6
      assert Triphthong.new('Litwo! Ojczyzno moja! ty jesteś jak zdrowie!').has_caesura_after? 7
      refute Triphthong.new('Litwo! Ojczyzno moja! ty jesteś jak zdrowie!').has_caesura_after? 9
      refute Triphthong.new('Litwo! Ojczyzno moja! ty jesteś jak zdrowie!').has_caesura_after? 12
      assert Triphthong.new('Litwo! Ojczyzno moja! ty jesteś jak zdrowie!').has_caesura_after? 13
      refute Triphthong.new('Litwo! Ojczyzno moja! ty jesteś jak zdrowie!').has_caesura_after? 14
      assert Triphthong.new('Podług niej później Karol-Kochanku-Radziwiłł').has_caesura_after? 7
    end

  end

  describe '#rhyme_pattern' do

    it 'returns the rhyme pattern' do
      Triphthong.new('Litwo! Ojczyzno moja! ty jesteś jak zdrowie!').rhyme_pattern.must_equal 'owie'
      Triphthong.new('Nowogródzki ochraniasz z jego wiernym ludem!').rhyme_pattern.must_equal 'udem'
      Triphthong.new('Bo je zbliżała dzieciom do ust po kolei;').rhyme_pattern.must_equal     'ei'
    end

    it 'works with Pan Tadeusz rhymes' do
      skip
      File.read('spec/fixtures/pan-tadeusz.txt').lines.map(&:chomp).reject(&:empty?).each_slice 2 do |a, b|
        Triphthong.new(a).rhyme_pattern.must_equal Triphthong.new(b).rhyme_pattern, "rhyme mismatch between ‘#{a}’ and ‘#{b}’"
      end
    end

  end

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
