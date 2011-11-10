# encoding: UTF-8

module Triphthong class Executable
  def initialize args = ARGV
    opts = Trollop.options args do
      opt :charlimit, 'Character limit',          default: 1000
      opt :database,  'Location of the database', default: 'db.yml'
      opt :structure, 'X+Y syllable structure',   default: '7+6', multi: true
    end

    Trollop.die '--structure must be of the form m+n (where m and n are numbers)' unless opts[:structure].all? { |s| s =~ /^\d+\+\d+$/ }

    @charlimit  = opts[:charlimit]
    @database   = opts[:database]
    @structures = opts[:structure]

    @action = args.shift
    @paths  = args
  end

  def run
    db = YAML::Store.new @database

    case @action
    when 'build-db'
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
    when 'rhyme'
      verses = []
      db.transaction true do
        rhymes = db[@structures.first].reject { |_, vs| vs.size < 2 }
        while verses.map(&:size).inject(0, :+) < @charlimit do
          a, b = rhymes[rhymes.keys.sample].sample 2
          next unless a.rhymes_with? b
          next if a.source and b.source and a.source == b.source
          verses += [a, b]
        end
      end
      verses.pop while verses.map(&:size).inject(0, :+) > @charlimit or (verses.size % 4).nonzero?
      puts verses.each_slice(4).map { |s| s.map(&:text).join "\n" }.join "\n\n"
    end
  end
end end
