require 'rake/testtask'
require 'rubocop/rake_task'

task default: %i[spec rubocop]

Rake::TestTask.new :spec do |task|
  task.test_files = FileList['spec/**/*_spec.rb']
  task.warning    = true
end

Rubocop::RakeTask.new
