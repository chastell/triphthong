require_relative 'rhymer'
require_relative 'settings'

module Triphthong class CLIRhymer
  def initialize args, rhymer: Rhymer
    @rhymer   = rhymer
    @settings = Settings.new args
  end

  def run
    puts rhymer.rhyme lenghts: settings.lenghts, rhymes: settings.rhymes
  end

  attr_reader :rhymer, :settings
  private     :rhymer, :settings
end end
