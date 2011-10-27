# encoding: UTF-8

require_relative 'spec_helper'

describe Triphthong do

  describe '.count_syllables' do

    it 'returns the number of syllables in the given String' do
      skip_lines = [
        '',
        'Siedemdziesiąt dwa lat liczył Maciej, starzec dziarski',
        'Czterema rogami, z których dwa jako kabłąki',
      ]
      File.read('spec/fixtures/pan-tadeusz.txt').lines.map(&:chomp).each do |line|
        next if skip_lines.include? line
        Triphthong.count_syllables(line).must_equal 13, "not 13 syllables in ‘#{line}’"
      end
    end

  end

end
