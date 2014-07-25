require 'optparse'

module Triphthong class Settings
  attr_reader :lengths, :rhymes

  def initialize args
    OptionParser.new do |opts|
      opts.on '-l', '--lengths LENGTHS', String, 'Verse lengths' do |lengths|
        @lengths = lengths
      end
      opts.on '-r', '--rhymes RHYMES', String, 'Rhyme patterns' do |rhymes|
        @rhymes = rhymes
      end
    end.parse! args
  end
end end
