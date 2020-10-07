class I386JosElfBinutils < Formula
  homepage "http://pdos.csail.mit.edu/6.828/2018/tools.html"
  url "http://ftpmirror.gnu.org/binutils/binutils-2.35.1.tar.bz2"
  sha256 "320e7a1d0f46fcd9f413f1046e216cbe23bb2bce6deb6c6a63304425e48b1942"

  def install
    system "./configure", "--prefix=#{prefix}",
                          "--target=i386-jos-elf",
                          "--disable-werror"
    system "make"
    system "make", "install"
    # avoid conflict with gdb
    if Formula["i386-jos-elf-gdb"].any_version_installed?
      rm_r share/"info"
      rm_r lib
    end
  end

  test do
    system "#{bin}/i386-jos-elf-objdump -i"
  end
end
