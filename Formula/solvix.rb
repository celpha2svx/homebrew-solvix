class Solvix < Formula
  desc "Continuous codebase judgment CLI for developers"
  homepage "https://github.com/celpha2svx/solvix"
  version "0.4.1"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/celpha2svx/solvix/releases/download/v0.4.1/solvix-macos-x64"
      sha256 "6cecb2a61f79882856976f90ccd38d25727248f6e666ee8d532361ca3cab64e9"
    end

    if Hardware::CPU.arm?
      url "https://github.com/celpha2svx/solvix/releases/download/v0.4.1/solvix-macos-arm64"
      sha256 "3357b1b47cde16fd422ac274caafe2c344249623c3731355c7459428eff6fa11"
    end
  end

  def install
    if Hardware::CPU.intel?
      bin.install "solvix-macos-x64" => "solvix"
    else
      bin.install "solvix-macos-arm64" => "solvix"
    end
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/solvix --version")
  end
end
