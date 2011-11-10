# encoding: UTF-8

module Triphthong class Executable
  def initialize args = ARGV
    @opts = Trollop.options args do
      opt :caesura,   'Require cæsura after the given syllable', type: Integer
      opt :datadir,   'Location of the data dir',                default: 'data'
      opt :structure, 'X+Y syllable structure',                  type: String
    end

    @caesura   = @opts[:structure_given] ? @opts[:structure].split('+').first.to_i             : nil
    @syllables = @opts[:structure_given] ? @opts[:structure].split('+').map(&:to_i).inject(:+) : nil

    @action = args.shift
    @files  = args
  end

  def run
    case @action
    when 'prepare'
      @files.each do |src|
        File.open "#{@opts[:datadir]}/#{File.basename src}", 'w' do |dest|
          File.read(src).extend(Text).sentences.each do |verse|
            next if @caesura   and not verse.has_caesura_after? @caesura
            next if @syllables and not verse.syllable_count == @syllables
            dest.puts verse
          end
        end
      end
    end
  end
end end
