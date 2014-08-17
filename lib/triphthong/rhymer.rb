require_relative 'verses'

module Triphthong
  class Rhymer
    def self.poem(lengths:, rhymes:, verses: Verses.new)
      structure     = rhymes.zip lengths
      rhyme_lengths = structure.group_by(&:first).map do |symbol, structs|
        [symbol, structs.map(&:last)]
      end.to_h
      rhyme_map = verses.rhyme_map rhyme_lengths
      structure.map do |symbol, length|
        verses.verse length: length, rhyme: rhyme_map[symbol]
      end.join "\n"
    end
  end
end
