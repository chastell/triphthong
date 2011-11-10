# encoding: UTF-8

require_relative '../spec_helper'

module Triphthong describe Verse do
  describe '#has_caesura_after?' do
    it 'returns a Boolean on whether the given String has a cæsura after the given syllable' do
      verse = Verse.new 'Litwo! Ojczyzno moja! ty jesteś jak zdrowie!'
      refute verse.has_caesura_after? 6
      assert verse.has_caesura_after? 7
      refute verse.has_caesura_after? 9
      refute verse.has_caesura_after? 12
      assert verse.has_caesura_after? 13
      refute verse.has_caesura_after? 14
      assert Verse.new('Podług niej później Karol-Kochanku-Radziwiłł').has_caesura_after? 7
    end
  end

  describe '#rhyme_pattern' do
    it 'returns the rhyme pattern' do
      Verse.new('Litwo! Ojczyzno moja! ty jesteś jak zdrowie!').rhyme_pattern.must_equal 'owie'
      Verse.new('Nowogródzki ochraniasz z jego wiernym ludem!').rhyme_pattern.must_equal 'udem'
      Verse.new('Bo je zbliżała dzieciom do ust po kolei;').rhyme_pattern.must_equal     'ei'
    end

    it 'doesn’t care for word boundaries' do
      Verse.new('…ją, Kasię!').rhyme_pattern.must_equal 'asię'
      Verse.new('jjjąka się…').rhyme_pattern.must_equal 'asię'

    end
  end

  describe '#rhymes_with?' do
    it 'is a predicate whether two Verses rhyme' do
      assert Verse.new('wyjaśnienie').rhymes_with? Verse.new 'wyżółcenie'
      refute Verse.new('siejąc ferment').rhymes_with? Verse.new 'niczym Reymont'
    end

    it 'rejects rhymes based on repetition' do
      refute Verse.new('Panowie').rhymes_with? Verse.new 'panowie'
      refute Verse.new('nie odjechał!').rhymes_with? Verse.new 'z nami jechał.'
      refute Verse.new('z nami jechał.').rhymes_with? Verse.new 'nie odjechał!'
    end
  end

  describe '#size' do
    it 'returns the Verse’s size' do
      Verse.new('ty jesteś jak zdrowie!').size.must_equal 22
    end
  end

  describe '#source' do
    it 'returns the source of the Verse' do
      Verse.new('Litwo! Ojczyzno moja!', 'Pan Tadeusz').source.must_equal 'Pan Tadeusz'
    end
  end

  describe '#syllable_count' do
    it 'returns the number of syllables' do
      Verse.new('Litwo! Ojczyzno moja! ty jesteś jak zdrowie!').syllable_count.must_equal 13
    end

    it 'handles edge cases' do
      {
        'Müller' => 2, 'Raphaël' => 3, 'Störch' => 1, 'Vorwärts' => 2,
        'Contrôleur' => 3, 'Docteur' => 2, 'Eugeniusz' => 3, 'Europa' => 3, 'Odyseusz' => 4, 'Tadeusz' => 3, 'eunuch' => 3, 'muzeum' => 3, 'neutralny' => 4, 'nieuczciwy' => 4, 'nieustraszony' => 5, 'przeuczony' => 4, 'reumatyzm' => 3, 'seulski' => 3, 'trofeum' => 3,
        'auto' => 2, 'inauguracja' => 5, 'kauczuk' => 2, 'naubijać' => 4, 'naubliżać' => 4, 'nauczanie' => 4, 'nauczka' => 3, 'nauka' => 3, 'nausznik' => 3, 'niezaułkowy' => 5, 'paranauka' => 5, 'zaułek' => 3, 'zauroczenie' => 5,
        'quiz' => 1,
        'jednousi' => 4, 'vous' => 1,
        'Fontain' => 2, 'betaina' => 4,
        'Escabeau' => 3, 'Fontainbleau' => 3, 'nieautoryzowany' => 7, 'nouveau' => 2, 'teleaudycja' => 5,
        'aequo' => 2, 'aere' => 2, 'aerobic' => 4, 'irae' => 2,
        'foi' => 1,
        'Zamoyski' => 3,
      }.each do |word, count|
        Verse.new("#{word}").syllable_count.must_equal          count, "not #{count} syllables in ‘#{word}’"
        Verse.new(" #{word} ").syllable_count.must_equal count, "not #{count} syllables in ‘ #{word} ’"
      end
    end
  end
end end
