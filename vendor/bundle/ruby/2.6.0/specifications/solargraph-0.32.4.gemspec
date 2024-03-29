# -*- encoding: utf-8 -*-
# stub: solargraph 0.32.4 ruby lib

Gem::Specification.new do |s|
  s.name = "solargraph".freeze
  s.version = "0.32.4"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Fred Snyder".freeze]
  s.date = "2019-05-28"
  s.description = "IDE tools for code completion, inline documentation, and static analysis".freeze
  s.email = "admin@castwide.com".freeze
  s.executables = ["solargraph".freeze, "solargraph-runtime".freeze]
  s.files = ["bin/solargraph".freeze, "bin/solargraph-runtime".freeze]
  s.homepage = "http://solargraph.org".freeze
  s.licenses = ["MIT".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 2.1".freeze)
  s.rubygems_version = "3.0.3".freeze
  s.summary = "A Ruby language server".freeze

  s.installed_by_version = "3.0.3" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<backport>.freeze, ["~> 1.1"])
      s.add_runtime_dependency(%q<bundler>.freeze, [">= 1.17.2"])
      s.add_runtime_dependency(%q<htmlentities>.freeze, ["~> 4.3", ">= 4.3.4"])
      s.add_runtime_dependency(%q<jaro_winkler>.freeze, ["~> 1.5"])
      s.add_runtime_dependency(%q<kramdown>.freeze, ["~> 1.16"])
      s.add_runtime_dependency(%q<parser>.freeze, ["~> 2.3"])
      s.add_runtime_dependency(%q<reverse_markdown>.freeze, ["~> 1.0", ">= 1.0.5"])
      s.add_runtime_dependency(%q<rubocop>.freeze, ["~> 0.52"])
      s.add_runtime_dependency(%q<thor>.freeze, ["~> 0.19", ">= 0.19.4"])
      s.add_runtime_dependency(%q<tilt>.freeze, ["~> 2.0"])
      s.add_runtime_dependency(%q<yard>.freeze, ["~> 0.9"])
      s.add_development_dependency(%q<pry>.freeze, ["~> 0.11.3"])
      s.add_development_dependency(%q<rspec>.freeze, [">= 3.5.0", "~> 3.5"])
      s.add_development_dependency(%q<simplecov>.freeze, ["~> 0.14"])
    else
      s.add_dependency(%q<backport>.freeze, ["~> 1.1"])
      s.add_dependency(%q<bundler>.freeze, [">= 1.17.2"])
      s.add_dependency(%q<htmlentities>.freeze, ["~> 4.3", ">= 4.3.4"])
      s.add_dependency(%q<jaro_winkler>.freeze, ["~> 1.5"])
      s.add_dependency(%q<kramdown>.freeze, ["~> 1.16"])
      s.add_dependency(%q<parser>.freeze, ["~> 2.3"])
      s.add_dependency(%q<reverse_markdown>.freeze, ["~> 1.0", ">= 1.0.5"])
      s.add_dependency(%q<rubocop>.freeze, ["~> 0.52"])
      s.add_dependency(%q<thor>.freeze, ["~> 0.19", ">= 0.19.4"])
      s.add_dependency(%q<tilt>.freeze, ["~> 2.0"])
      s.add_dependency(%q<yard>.freeze, ["~> 0.9"])
      s.add_dependency(%q<pry>.freeze, ["~> 0.11.3"])
      s.add_dependency(%q<rspec>.freeze, [">= 3.5.0", "~> 3.5"])
      s.add_dependency(%q<simplecov>.freeze, ["~> 0.14"])
    end
  else
    s.add_dependency(%q<backport>.freeze, ["~> 1.1"])
    s.add_dependency(%q<bundler>.freeze, [">= 1.17.2"])
    s.add_dependency(%q<htmlentities>.freeze, ["~> 4.3", ">= 4.3.4"])
    s.add_dependency(%q<jaro_winkler>.freeze, ["~> 1.5"])
    s.add_dependency(%q<kramdown>.freeze, ["~> 1.16"])
    s.add_dependency(%q<parser>.freeze, ["~> 2.3"])
    s.add_dependency(%q<reverse_markdown>.freeze, ["~> 1.0", ">= 1.0.5"])
    s.add_dependency(%q<rubocop>.freeze, ["~> 0.52"])
    s.add_dependency(%q<thor>.freeze, ["~> 0.19", ">= 0.19.4"])
    s.add_dependency(%q<tilt>.freeze, ["~> 2.0"])
    s.add_dependency(%q<yard>.freeze, ["~> 0.9"])
    s.add_dependency(%q<pry>.freeze, ["~> 0.11.3"])
    s.add_dependency(%q<rspec>.freeze, [">= 3.5.0", "~> 3.5"])
    s.add_dependency(%q<simplecov>.freeze, ["~> 0.14"])
  end
end
