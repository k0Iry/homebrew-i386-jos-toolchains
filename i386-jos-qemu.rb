class I386JosElfGdb < Formula
  homepage "http://pdos.csail.mit.edu/6.828/2018/tools.html"
  url "https://github.com/k0Iry/6.828-qemu/archive/2.3.0.tar.gz"
  sha256 "988f8df2cfddb806008a23604aea643885c10af515b43557cfc75f5911d80942"

  def install
    system "./configure", "--prefix=#{prefix}",
                          "[--target-list="i386-softmmu x86_64-softmmu"]",
                          "--disable-sdl",
                          "--disable-kvm",
                          "--disable-werror"
    system "make"
    system "make", "install"
  end

  test do
    system "#{bin}/i386-jos-elf-gdb -v"
  end
end
