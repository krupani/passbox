Gem::Specification.new do |s|
    s.name					=	'passbox'
	s.version				=	File.read(File.expand_path("../lib/passbox/version", __FILE__))
	s.platform   		    =   Gem::Platform::RUBY
	s.summary				=	'PassBox gem : AES encrypted offline password manager'
	s.description		    =	'A gem to store and manage password offline, encrypted using AES 256 strong encryption.'
	s.authors				=	['Kaushal Rupani']
	s.email					=	'kushrupani@live.com'
	s.files					=	Dir.glob("{lib,data}/**/*") + %w(README.md LICENSE)
	# s.test_files  	        =   `git ls-files -- {spec,features}/*`.split("\n") + %w(Rakefile)
	s.executables 	        <<  'passbox'
	s.homepage			    =	'https://github.com/krupani/passbox'
	s.license				=   'MIT'
	s.required_ruby_version =   '~> 2'
	# s.add_runtime_dependency('bundler', '>=1')
	# s.add_development_dependency('selenium-webdriver', '~>3')
	# s.add_development_dependency('watir', '~>6')
	# s.post_install_message 	= "\n\n=>=>=>=>=> Thank you for installing TestNow gem. <=<=<=<=<= \n\n"
end