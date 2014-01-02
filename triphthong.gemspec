Gem::Specification.new do |gem|
  gem.name        = 'triphthong'
  gem.version     = '0.0.0'
  gem.summary     = 'Triphthong: a syllable counter'
  gem.description = 'Triphthong counts syllables in Polish text'
  gem.homepage    = 'https://github.com/chastell/triphthong'
  gem.author      = 'Piotr Szotkowski'
  gem.email       = 'chastell@chastell.net'

  gem.files       = `git ls-files -z`.split "\0"
  gem.executables = `git ls-files -z -- bin/*`.split("\0").map { |file| File.basename file }
  gem.test_files  = `git ls-files -z -- spec/*`.split "\0"

  gem.add_dependency 'srx-polish'
  gem.add_dependency 'trollop'
  gem.add_dependency 'unicode'
  gem.add_development_dependency 'fakeweb'
  gem.add_development_dependency 'minitest', '~> 5.0'
  gem.add_development_dependency 'rake'
  gem.add_development_dependency 'vcr'
end
