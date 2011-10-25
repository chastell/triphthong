# encoding: UTF-8

require_relative 'spec_helper'

describe Triphthong do

  describe '.count_syllables' do

    it 'returns the number of syllables in the given String' do
      File.read('spec/fixtures/pan-tadeusz.txt').each_line do |line|
        next if line.chomp.empty?
        Triphthong.count_syllables(line).must_equal 13, "not 13 syllables in ‘#{line.chomp}’"
      end
    end

  end

end
