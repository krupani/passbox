class Passbox < Formula
    desc "Ruby based minimalistic offline cli password manager using strong AES encryption"
    homepage "https://github.com/krupani/passbox/tree/develop"
    url "https://github.com/krupani/passbox/archive/develop.zip"
    version "1.0.0"
    sha256 "02ee9fd417e55446080db9b78ab58eef303f2df029cdb159255424c028cdf77b"
  
    uses_from_macos "ruby"
  
    def install
      ENV["GEM_HOME"] = libexec
      system "gem", "build", "#{name}.gemspec"
      system "gem", "install", "#{name}-#{version}.gem"
      bin.install libexec/"bin/#{name}"
      bin.env_script_all_files(libexec/"bin", GEM_HOME: ENV["GEM_HOME"])
    end
  
    test do
      system "#{bin}/passbox"
    end
  end