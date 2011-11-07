# encoding: UTF-8

module Triphthong class Executable
  def initialize args
    @opts = Trollop.options args do
      opt :caesura,        'Require cæsura after the given syllable', type: Integer
      opt :datadir,        'Location of the data dir',                default: 'data'
      opt :syllable_count, 'Number of syllables',                     type: Integer
    end
    @args = args
  end

  def run
    case @args.shift
    when 'prepare'
      @args.each do |src|
        File.open "#{@opts[:datadir]}/#{File.basename src}", 'w' do |dest|
          File.read(src).extend(Text).sentences.each do |sentence|
            sentence.extend Verse
            next if @opts[:caesura_given]        and not sentence.has_caesura_after? @opts[:caesura]
            next if @opts[:syllable_count_given] and sentence.syllable_count != @opts[:syllable_count]
            dest.puts sentence
          end
        end
      end
    end
  end
end end
