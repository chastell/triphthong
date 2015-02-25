require 'procto'
require_relative 'verses'

module Triphthong
  class Rhymer
    include Procto.call(:poem)

    def initialize(lengths:, rhymes:, verses:)
      @lengths = lengths
      @rhymes  = rhymes
      @verses  = verses
    end

    def poem
      structure.map do |symbol, length|
        verses.verse(length: length, rhyme: rhyme_map[symbol]) + "\n"
      end.join
    end

    private_attr_reader :lengths, :rhymes, :verses

    private

    def rhyme_lengths
      structure.group_by(&:first).map do |symbol, structs|
        [symbol, structs.map(&:last)]
      end.to_h
    end

    def rhyme_map
      @rhyme_map ||= verses.rhyme_map(rhyme_lengths)
    end

    def structure
      @structure ||= rhymes.zip(lengths)
    end
  end
end
