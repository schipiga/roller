# Provide a simple gemspec so you can easily use your enginex
# project in your rails apps through git.
Gem::Specification.new do |s|
  s.name = "roller"
  s.version = "0.0.1"
  s.summary = "Field value management of model."
  s.description = "It allow to manage a field value of a model depending from its previous value."
  s.author = 'Sergey Chipiga'
  s.email = 'sergey.chipiga@flatstack.com'
  s.homepage = 'https://github.com/sergeychipiga/roller'
  s.files = Dir["{app,lib,config}/**/*"] + ["MIT-LICENSE", "Rakefile", "Gemfile", "README.rdoc"]
end
