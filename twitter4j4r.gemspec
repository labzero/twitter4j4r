# -*- encoding: utf-8 -*-
require File.expand_path('../lib/twitter4j4r/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Tobias Crawley", "Marek Jelen", "Matt Darling"]
  gem.email         = ["toby@tcrawley.org","", "mdarling@labzero.com"]
  gem.description   = %q{A thin, woefully inadequate wrapper around http://twitter4j.org/.  Extended to properly support streams.}
  gem.summary       = %q{A thin, woefully inadequate wrapper around http://twitter4j.org/ that supports the stream api with keywords, the userstream, and the sitestream.}
  gem.homepage      = "https://github.com/labzero/twitter4j4r"

  gem.platform      = "java"
  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "twitter4j4r"
  gem.require_paths = ["lib"]
  gem.version       = Twitter4j4r::VERSION
end
