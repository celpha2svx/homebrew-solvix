class Solvix < Formula
  desc "Computational intelligence layer for developers"
  homepage "https://github.com/celpha2svx/solvix"
  version "0.2.5"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/celpha2svx/solvix/releases/download/v0.2.5/solvix-macos-x64"
      sha256 "92f50a2aa78bf6910c8d5cf491ecfdff5419d7201beabc9f3805455c3c20ce6e"
    end

    if Hardware::CPU.arm?
      url "https://github.com/celpha2svx/solvix/releases/download/v0.2.5/solvix-macos-arm64"
      sha256 "e688c2f3d2966bf406e4317193db5ac69f6edad14696d9ffa14ee0f1384cf562"
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
