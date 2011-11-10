# encoding: UTF-8

module Triphthong class Executable
  def initialize args = ARGV
    opts = Trollop.options args do
      opt :datadir,   'Location of the data dir', default: 'data'
      opt :structure, 'X+Y syllable structure',   multi: true, type: String
    end

    if opts[:structure_given]
      Trollop.die '--structure must be of the form m+n (where m and n are numbers)' unless opts[:structure].all? { |s| s =~ /^\d+\+\d+$/ }
    end

    @structures = opts[:structure].map do |structure|
      { caesura: structure.split('+').first.to_i, count: structure.split('+').map(&:to_i).inject(:+) }
    end

    @datadir = opts[:datadir]
    @action  = args.shift
    @files   = args
  end

  def run
    case @action
    when 'prepare'
      @files.each do |src|
        File.open "#{@datadir}/#{File.basename src}", 'w' do |dest|
          File.read(src).extend(Text).sentences.each do |verse|
            dest.puts verse if @structures.empty? or @structures.any? do |structure|
              verse.syllable_count == structure[:count] and verse.has_caesura_after? structure[:caesura]
            end
          end
        end
      end
    end
  end
end end
