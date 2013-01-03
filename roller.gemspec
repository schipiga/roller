# Provide a simple gemspec so you can easily use your enginex
# project in your rails apps through git.
Gem::Specification.new do |s|
  s.name = "roller"
  s.version = "0.0.1"
  s.summary = "Status field management of model."
  s.description = "It allow to manage next status of model depending from previous value."
  s.authors = ['Sergey Chipiga']
  s.email = 'sergey.chipiga@flatstack.com'
  s.files = Dir["{app,lib,config}/**/*"] + ["MIT-LICENSE", "Rakefile", "Gemfile", "README.rdoc"]
end
