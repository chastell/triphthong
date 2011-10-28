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
        'Nie tak dawno! takeś zestarzał się z żalu!',
        'Nawet Stolnika…',
        'Wiesz!…',
        'Chwila, jedna iskierka…',
        'Przecież nie byłem zdrajcą kraju.',
        'Wiedziałem to, a przecież — nie mogłem.',
        'Uciekłem z kraju !…',
        'Gdziem nie był! com nie cierpiał!…',
        'Ile możności to…',
        'Kazałem ją hodować…',
        'Że jako robak w prochu…',
        'Krwią, poświęceniem się…',
        'I cierpienia, których nikt…',
        'Z sakramentami…',
        'Ta myśl… zdaje się czysta…',
        'I pana Tadeusza z Zofią przywodzi.',
        'Dobył z kieszeni portefeuille z plikami papierów,',
        'Tadeusz i Zofia do stołu nie siedli;',
        'Mawiali, poglądając na Dymuliera,',
        '«Zofio! muszę ciebie w bardzo ważnej rzeczy',
        'Lecz ty Zofio, jesteś z wysokiego rodu,',
        'Tadeusz i Zofia ustawnie klaskali,',
      ]
      File.read('spec/fixtures/pan-tadeusz.txt').lines.map(&:chomp).each do |line|
        next if skip_lines.include? line
        Triphthong.count_syllables(line).must_equal 13, "not 13 syllables in ‘#{line}’"
      end
    end

  end

end
