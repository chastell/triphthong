# encoding: UTF-8

module Triphthong class Executable
  def initialize args = ARGV
    opts = Trollop.options args do
      opt :datadir,   'Location of the data dir', default: 'data'
      opt :structure, 'X+Y syllable structure',   multi: true, type: String
    end

    Trollop.die '--structure must be of the form m+n (where m and n are numbers)' unless opts[:structure].all? { |s| s =~ /^\d+\+\d+$/ }

    @structures = Hash[opts[:structure].map do |str|
      [str, { caesura: str.split('+').first.to_i, count: str.split('+').map(&:to_i).inject(:+) }]
    end]

    @datadir = opts[:datadir]
    @action  = args.shift
    @paths   = args
  end

  def run
    case @action
    when 'build-db'
      db = YAML::Store.new @datadir
      db.transaction do
        @structures.each { |str, _| db[str] = [] }
      end
      db.transaction do
        @paths.each do |path|
          File.read(path).extend(Text).sentences.each do |verse|
            verse.source = File.basename path
            @structures.each do |str, parts|
              db[str] << verse if verse.syllable_count == parts[:count] and verse.has_caesura_after? parts[:caesura]
            end
          end
        end
      end
    when 'prepare'
      @paths.each do |path|
        File.open "#{@datadir}/#{File.basename path}", 'w' do |dest|
          File.read(path).extend(Text).sentences.each do |verse|
            dest.puts verse if @structures.empty? or @structures.any? do |_, parts|
              verse.syllable_count == parts[:count] and verse.has_caesura_after? parts[:caesura]
            end
          end
        end
      end
    end
  end
end end
