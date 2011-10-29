# encoding: UTF-8

require_relative 'spec_helper'

describe Triphthong do

  describe '.count_syllables' do

    it 'returns the number of syllables in the given String' do
      skip_lines = [
        '',
        'Bogacz i familiant, miał jedyne dziecię,',
        'Czy żyje wielki Baublis, w którego ogromie',
        'Więc spolia opima weźmiesz, mości Hrabia:',
        'A wyuczyłem śpiewać fein moje bachurki».',
        'Jako zaklęte w górach kaukaskich jeziora',
        'I harmonią cudną orkiestry podwodnej,',
        'Słowem, cum gais, boris et graniciebus,',
        'I często zarywał się:',
        'W duszy mojej!…',
        'Ale i on…',
        'O procesach, sejmikach, łowach…',
        'Jak gdybym Sanktissimum ujrzał!',
        'Gdyby wiedziano, że ja Jacek…',
        'Jak ślimak rogów!',
        'Nie mogłem, nie.',
        'Pomścić się…',
        'Zacząłem pić.',
        'Popełniłem…',
        'Nawet Stolnika…',
        'Wiesz!…',
        'Chwila, jedna iskierka…',
        'Przecież nie byłem zdrajcą kraju.',
        'Wiedziałem to, a przecież — nie mogłem.',
        'Uciekłem z kraju!…',
        'Gdziem nie był! com nie cierpiał!…',
        'Ile możności to…',
        'Kazałem ją hodować…',
        'Że jako robak w prochu…',
        'Krwią, poświęceniem się…',
        'I cierpienia, których nikt…',
        'Z sakramentami…',
        'Ta myśl… zdaje się czysta…',
        'Dobył z kieszeni portefeuille z plikami papierów,',
      ]
      File.read('spec/fixtures/pan-tadeusz.txt').lines.map(&:chomp).each do |line|
        next if skip_lines.include? line
        Triphthong.count_syllables(line).must_equal 13, "not 13 syllables in ‘#{line}’"
      end
    end

  end

end
