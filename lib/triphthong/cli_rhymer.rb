require_relative 'rhymer'
require_relative 'settings'

module Triphthong class CLIRhymer
  def initialize args, rhymer: Rhymer.new
    @rhymer   = rhymer
    @settings = Settings.new args
  end

  def run
    puts rhymer.poem lengths: settings.lengths, rhymes: settings.rhymes
  end

  attr_reader :rhymer, :settings
  private     :rhymer, :settings
end end
