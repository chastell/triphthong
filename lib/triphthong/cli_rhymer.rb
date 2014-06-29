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
end end
