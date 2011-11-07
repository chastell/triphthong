module Triphthong class Executable
  def initialize args
    @opts = Trollop.options args do
      opt :datadir, 'Location of the data dir', default: 'data'
    end
    @args = args
  end

  def run
    case @args.shift
    when 'prepare'
      @args.each do |src|
        File.open "#{@opts[:datadir]}/#{File.basename src}", 'w' do |dest|
          File.read(src).extend(Text).sentences.each { |sentence| dest.puts sentence }
        end
      end
    end
  end
end end
