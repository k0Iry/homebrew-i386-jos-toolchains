
class I386JosElfGdb < Formula
  homepage "http://pdos.csail.mit.edu/6.828/2018/tools.html"
  url "https://gnuftp.uib.no/gdb/gdb-8.3.1.tar.xz"
  sha256 "1e55b4d7cdca7b34be12f4ceae651623aa73b2fd640152313f9f66a7149757c4"

  def install
    system "./configure", "--prefix=#{prefix}",
                          "--target=i386-jos-elf",
                          "--program-prefix=i386-jos-elf-",
                          "--disable-werror"
    system "make", "all"
    system "make", "install"
    # avoid conflict with binutil
    if Formula["i386-jos-elf-binutils"].any_version_installed?
      rm_r share/"info"
      rm_r lib
    end
  end

  test do
    system "#{bin}/i386-jos-elf-gdb -v"
  end
end
