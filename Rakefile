require 'rake/testtask'
require_relative 'lib/triphthong'

Rake::TestTask.new :spec do |task|
  task.test_files = FileList['spec/**/*_spec.rb']
  task.warning    = true
end

namespace :spec do
  Rake::TestTask.new :fast do |task|
    task.test_files = FileList['spec/**/*_spec.rb'] - FileList['spec/**/*_slow_spec.rb']
    task.warning    = true
  end
end

# FIXME: factor out and spec
task :db_cleanup do
  db = YAML::Store.new 'db.yml'
  db.transaction do
    db.roots.each do |structure|
      db[structure].each do |rhyme, verses|
        db[structure].delete rhyme if verses.size < 2
      end
    end
  end
end

task default: :spec
