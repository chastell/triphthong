# encoding: UTF-8

require_relative '../spec_helper'

module Triphthong describe Verse do
  describe '#has_caesura_after?' do
    it 'returns a Boolean on whether the given String has a cæsura after the given syllable' do
      verse = 'Litwo! Ojczyzno moja! ty jesteś jak zdrowie!'.extend Verse
      refute verse.has_caesura_after? 6
      assert verse.has_caesura_after? 7
      refute verse.has_caesura_after? 9
      refute verse.has_caesura_after? 12
      assert verse.has_caesura_after? 13
      refute verse.has_caesura_after? 14
      assert 'Podług niej później Karol-Kochanku-Radziwiłł'.extend(Verse).has_caesura_after? 7
    end

    it 'works with Pan Tadeusz cæsuræ' do
      File.read('spec/fixtures/pan-tadeusz.txt').lines.map(&:chomp).each do |line|
        next if line.empty? or line.start_with? ' '
        assert line.extend(Verse).has_caesura_after?(7), "no cæsura after 7th syllable in ‘#{line}’"
      end
    end
  end

  describe '#rhyme_pattern' do
    it 'returns the rhyme pattern' do
      'Litwo! Ojczyzno moja! ty jesteś jak zdrowie!'.extend(Verse).rhyme_pattern.must_equal 'owie'
      'Nowogródzki ochraniasz z jego wiernym ludem!'.extend(Verse).rhyme_pattern.must_equal 'udem'
      'Bo je zbliżała dzieciom do ust po kolei;'.extend(Verse).rhyme_pattern.must_equal     'ei'
    end
  end

  describe '#syllable_count' do
    it 'returns the number of syllables' do
      File.read('spec/fixtures/pan-tadeusz.txt').lines.map(&:chomp).each do |line|
        next if line.empty? or line.start_with? ' '
        line.extend(Verse).syllable_count.must_equal 13, "not 13 syllables in ‘#{line}’"
      end
    end

    it 'handles edge cases' do
      {
        'Müller' => 2, 'Raphaël' => 3, 'Störch' => 1, 'Vorwärts' => 2,
        'Odyseusz' => 4, 'muzeum' => 3, 'neutralny' => 4, 'nieuczciwy' => 4, 'nieustraszony' => 5, 'przeuczony' => 4, 'reumatyzm' => 3, 'seulski' => 3, 'trofeum' => 3,
        'inauguracja' => 5, 'kauczuk' => 2, 'niezaułkowy' => 5, 'paranauka' => 5, 'zaułek' => 3,
        'quiz' => 1,
      }.each do |word, count|
        "z #{word} z".extend(Verse).syllable_count.must_equal count, "not #{count} syllables in ‘#{word}’"
      end
    end
  end
end end