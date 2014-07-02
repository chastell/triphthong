require 'optparse'

module Triphthong class Settings
  attr_reader :lenghts, :rhymes

  def initialize args
    OptionParser.new do |opts|
      opts.on '-l', '--lenghts LENGHTS', String, 'Verse lenghts' do |lenghts|
        @lenghts = lenghts
      end
      opts.on '-r', '--rhymes RHYMES', String, 'Rhyme patterns' do |rhymes|
        @rhymes = rhymes
      end
    end.parse! args
  end
end end
