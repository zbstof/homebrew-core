class CargoCompletion < Formula
  desc "Bash and Zsh completion for Cargo"
  homepage "https://github.com/rust-lang/cargo"
  url "https://github.com/rust-lang/cargo/archive/0.29.0.tar.gz"
  sha256 "9aedb9536ec0b92059ed06b79a72798daf14e3fbcf29fac308ac07d23a9493d3"
  version_scheme 1
  head "https://github.com/rust-lang/cargo.git"

  bottle :unneeded

  def install
    bash_completion.install "src/etc/cargo.bashcomp.sh" => "cargo"
    zsh_completion.install "src/etc/_cargo"
  end

  test do
    # we need to define a dummy 'cargo' command to force the script to define
    # the completion function
    assert_match "-F _cargo",
      shell_output("cargo() { true;} && source #{bash_completion}/cargo && complete -p cargo")
  end
end
