require 'rake/testtask'

Rake::TestTask.new :spec do |task|
  task.test_files = FileList['spec/**/*_spec.rb']
end

namespace :spec do
  Rake::TestTask.new :fast do |task|
    task.test_files = FileList['spec/**/*_spec.rb'] - FileList['spec/**/*_slow_spec.rb']
  end
end

task default: :spec
