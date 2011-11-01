# encoding: UTF-8

require_relative 'spec_helper'

describe Triphthong do

  describe '#syllable_count' do

    it 'returns the number of syllables' do
      skip_lines = [
        '',
        'Czy żyje wielki Baublis, w którego ogromie',
        'A wyuczyłem śpiewać fein moje bachurki».',
        'Jako zaklęte w górach kaukaskich jeziora',
        'Słowem, cum gais, boris et graniciebus,',
        'Dobył z kieszeni portefeuille z plikami papierów,',
      ]
      File.read('spec/fixtures/pan-tadeusz.txt').lines.map(&:chomp).each do |line|
        next if skip_lines.include? line or line.start_with? ' '
        Triphthong.new(line).syllable_count.must_equal 13, "not 13 syllables in ‘#{line}’"
      end
    end

    it 'handles edge cases' do
      {
        'Müller' => 2,
      }.each do |word, count|
        Triphthong.new(word).syllable_count.must_equal count, "not #{count} syllables in ‘#{word}’"
      end
    end

  end

  describe '#syllables' do

    it 'returns the syllables' do
      Triphthong.new('Litwo! Ojczyzno moja! ty jesteś jak zdrowie!').syllables.must_equal ['li', 'two', 'o', 'jczy', 'zno', 'mo', 'ja', 'ty', 'je', 'ste', 'ś ja', 'k zdro', 'wie']
      Triphthong.new('Nowogródzki ochraniasz z jego wiernym ludem!').syllables.must_equal ['no', 'wo', 'gró', 'dzki', 'o', 'chra', 'nia', 'sz z je', 'go', 'wie', 'rny', 'm lu', 'dem']
      Triphthong.new('Bo je zbliżała dzieciom do ust po kolei;').syllables.must_equal ['bo', 'je', 'zbli', 'ża', 'ła', 'dzie', 'cio', 'm do', 'u', 'st po', 'ko', 'le', 'i']
    end

  end

end
