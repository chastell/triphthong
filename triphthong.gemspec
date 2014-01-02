Gem::Specification.new do |gem|
  gem.name        = 'triphthong'
  gem.version     = '0.1.0'
  gem.summary     = 'Triphthong: a syllable counter'
  gem.description = 'Triphthong counts syllables in Polish text'
  gem.homepage    = 'https://github.com/chastell/triphthong'
  gem.author      = 'Piotr Szotkowski'
  gem.email       = 'chastell@chastell.net'

  gem.files       = `git ls-files -z`.split "\0"
  gem.executables = gem.files.grep(%r{^bin/}).map { |path| File.basename path }
  gem.test_files  = gem.files.grep %r{^spec/.*\.rb$}

  gem.add_development_dependency 'minitest', '~> 5.0'
end
