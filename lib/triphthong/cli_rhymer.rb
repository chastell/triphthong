require_relative 'rhymer'
require_relative 'settings'

module Triphthong
  class CLIRhymer
    def initialize(args, rhymer: Rhymer)
      @rhymer   = rhymer
      @settings = Settings.new args
    end

    def run
      puts rhymer.call(lengths: settings.lengths, rhymes: settings.rhymes)
    end

    private_attr_reader :rhymer, :settings
  end
end
