class Clib < Formula
  desc "Package manager for C programming"
  homepage "https://github.com/clibs/clib"
  url "https://github.com/clibs/clib/archive/2.2.0.tar.gz"
  sha256 "f0afbfefa474508263b991e44939d04828a02c8cf28745f400bbe18bd240bf03"
  license "MIT"
  head "https://github.com/clibs/clib.git"

  livecheck do
    url :head
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  bottle do
    cellar :any_skip_relocation
    sha256 "d54bfe10399007254b99030bccdda88022fad83ca4d38e6e52d23c862d8cea21" => :catalina
    sha256 "c28e710c86b50f422f941887b04611bb4b74bdae8320b742e53817eac226f909" => :mojave
    sha256 "d098874750e444935abef12e4cbe0e933e9e2c4b6fd52cdbeda1326e107deeb8" => :high_sierra
  end

  uses_from_macos "curl"

  def install
    ENV["PREFIX"] = prefix
    system "make", "install"
  end

  test do
    system "#{bin}/clib", "install", "stephenmathieson/rot13.c"
  end
end
