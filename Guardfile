guard :bundler do
  watch('Gemfile')
end

guard 'rake', :task => 'spec' do
  watch(%r{^lib/(.+)\.rb$})     { "bundle exec rake" }
  watch(%r{^spec/(.+)\.rb$})    { "bundle exec rake" }
  watch(%r{^*.rb$})             { "bundle exec rake" }
end

