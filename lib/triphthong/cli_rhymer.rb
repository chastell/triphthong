module Triphthong class CLIRhymer
  def initialize args, rhymer: Rhymer
    @settings = Settings.new args
    @rhymer   = rhymer
  end

  def run
    puts rhymer.rhyme lenghts: settings.lenghts, rhymes: settings.rhymes
  end

  attr_reader :rhymer, :settings
  private     :rhymer, :settings

  private

  class Settings
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
  end
end end
