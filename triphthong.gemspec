require 'English'
require 'pathname'

Gem::Specification.new do |gem|
  gem.name        = 'triphthong'
  gem.version     = '0.1.0'
  gem.summary     = 'Triphthong: a syllable counter'
  gem.description = 'Triphthong counts syllables in Polish text'
  gem.homepage    = 'https://github.com/chastell/triphthong'
  gem.author      = 'Piotr Szotkowski'
  gem.email       = 'chastell@chastell.net'

  gem.files       = `git ls-files -z`.split("\0")
  gem.executables = gem.files.grep(%r{^bin/}).map { |path| File.basename(path) }
  gem.test_files  = gem.files.grep(%r{^test/.*\.rb$})

  gem.cert_chain  = ['certs/chastell.pem']
  if Pathname.new($PROGRAM_NAME).basename == Pathname.new('gem')
    gem.signing_key = Pathname.new('~/.ssh/gem-private_key.pem').expand_path
  end

  gem.add_dependency 'private_attr', '~> 1.1'
  gem.add_dependency 'procto',       '~> 0.0.2'

  gem.add_development_dependency 'bogus',    '~> 0.1.4'
  gem.add_development_dependency 'minitest', '~> 5.6'
  gem.add_development_dependency 'reek',     '~> 4.0'
  gem.add_development_dependency 'rubocop',  '~> 0.42.0'
end
