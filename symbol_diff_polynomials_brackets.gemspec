# frozen_string_literal: true

require_relative "lib/symbol_diff_polynomials_brackets/version"

Gem::Specification.new do |spec|
  spec.name = "symbol_diff_polynomials_brackets"
  spec.version = SymbolDiffPolynomialsBrackets::VERSION
   spec.authors       = [
    "Баев Кирилл Русланович", 
    "Ляшова Валерия Максимовна",
    "Бондаренко Алина Сергеевна",
    "Карпун Дмитрий Дмитриевич"
  ]
  spec.email = ["146315836+DimastaK05@users.noreply.github.com"]

  spec.summary = "Символьное дифференцирование многочленов и раскрытие скобок"
  spec.description = "Гем для символьного диференцирования и раскрытия скобок полиномов"
  spec.homepage = "https://github.com/DimastaK05/sKVAD"
  spec.required_ruby_version = ">= 3.0.0"


  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/DimastaK05/sKVAD"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  gemspec = File.basename(__FILE__)
  spec.files = IO.popen(%w[git ls-files -z], chdir: __dir__, err: IO::NULL) do |ls|
    ls.readlines("\x0", chomp: true).reject do |f|
      (f == gemspec) ||
        f.start_with?(*%w[bin/ test/ spec/ features/ .git appveyor Gemfile])
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Uncomment to register a new dependency of your gem
  # spec.add_dependency "example-gem", "~> 1.0"
  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "rake", "~> 13.0"
  spec.add_development_dependency "rspec", "~> 3.0"

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
end
