# encoding: UTF-8

require_relative 'spec_helper'

describe Triphthong do

  describe '.count_syllables' do

    it 'returns the number of syllables in the given String' do
      skip_lines = [
        '',
        'Bogacz i familiant, miał jedyne dziecię,',
        'I straszne Pauzylipu skaliste wydroże!',
        'Czy żyje wielki Baublis, w którego ogromie',
        'Więc spolia opima weźmiesz, mości Hrabia:',
        'Siedemdziesiąt dwa lat liczył Maciej, starzec dziarski',
        'A wyuczyłem śpiewać fein moje bachurki».',
        'Pod godłem Orientis Fulmen, prawił wiele',
        'I harmonią cudną orkiestry podwodnej,',
        '«Panno Zofio — rzecze — pani Telimeno!',
        'Słowem, cum gais, boris et graniciebus,',
        'Et quibusdam aliis. Jak tam wiesz, tak szczekaj,',
        'Czterema rogami, z których dwa jako kabłąki',
      ]
      File.read('spec/fixtures/pan-tadeusz.txt').lines.map(&:chomp).each do |line|
        next if skip_lines.include? line
        Triphthong.count_syllables(line).must_equal 13, "not 13 syllables in ‘#{line}’"
      end
    end

  end

end
