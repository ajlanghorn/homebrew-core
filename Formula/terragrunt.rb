class Terragrunt < Formula
  desc "Thin wrapper for Terraform e.g. for locking state"
  homepage "https://github.com/gruntwork-io/terragrunt"
  url "https://github.com/gruntwork-io/terragrunt/archive/v0.23.40.tar.gz"
  sha256 "37ad2bdc9b72b3380174c5886009626ff2369cb0d9c7e19c45f97e152de131fc"
  license "MIT"

  bottle do
    cellar :any_skip_relocation
    sha256 "bd794fa1a52c47d59dcbb641355f854f103a5ac1bd237bf8e00968e10bb4dbd4" => :catalina
    sha256 "6629a3152b6cb712a8fd6d4d99401f8aff1173e7a93e26383d91ec21e9bead53" => :mojave
    sha256 "9f065d6f65666df5f1d6d67fb5d91e0751452fa087aede6d7b2f59f8864c4c4a" => :high_sierra
  end

  depends_on "go" => :build
  depends_on "terraform"

  def install
    system "go", "build", "-ldflags", "-X main.VERSION=v#{version}", *std_go_args
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/terragrunt --version")
  end
end
