# encoding: UTF-8

module Triphthong class Executable
  def initialize args = ARGV
    opts = Trollop.options args do
      opt :database,  'Location of the database', default: 'db.yml'
      opt :structure, 'X+Y syllable structure',   default: '7+6', multi: true
    end

    Trollop.die '--structure must be of the form m+n (where m and n are numbers)' unless opts[:structure].all? { |s| s =~ /^\d+\+\d+$/ }

    @structures = opts[:structure]
    @database   = opts[:database]
    @action     = args.shift
    @paths      = args
  end

  def run
    case @action
    when 'build-db'
      db = YAML::Store.new @database
      db.transaction do
        @structures.each { |str, _| db[str] = Hash.new { |str, rhyme| str[rhyme] = [] } }
        @paths.each do |path|
          File.read(path).extend(Text).sentences.each do |verse|
            verse.source = File.basename path
            @structures.each do |str|
              db[str][verse.rhyme_pattern] << verse if verse.has_structure? str
            end
          end
        end
      end
    end
  end
end end
