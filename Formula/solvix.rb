class Solvix < Formula
  desc "Computational intelligence layer for developers"
  homepage "https://github.com/celpha2svx/solvix"
  version "0.3.1"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/celpha2svx/solvix/releases/download/v0.3.1/solvix-macos-x64"
      sha256 "71a9786924a1dbd76dcf33f54d880bd8d106867a6b80dc7db1f9d3358c38f141"
    end

    if Hardware::CPU.arm?
      url "https://github.com/celpha2svx/solvix/releases/download/v0.3.1/solvix-macos-arm64"
      sha256 "f93d3850514e5c60e9ddd6b0b71bc9e2530886271608d7ff7bcf393cdbeb9f84"
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
