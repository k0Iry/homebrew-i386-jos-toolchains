class I386JosElfGcc < Formula
  homepage "http://pdos.csail.mit.edu/6.828/2014/tools.html"
  url "https://gnuftp.uib.no/gcc/gcc-8.3.0/gcc-8.3.0.tar.xz"
  sha256 "64baadfe6cc0f4947a84cb12d7f0dfaf45bb58b7e92461639596c21e02d97d2c"

  depends_on 'gmp'
  depends_on 'libmpc'
  depends_on 'mpfr'
  depends_on 'i386-jos-elf-binutils'

  def install
    mkdir 'build' do
      system "../configure", "--prefix=#{prefix}",
                             "--target=i386-jos-elf",
                             "--disable-werror",
                             "--disable-libssp",
                             "--disable-libmudflap",
                             "--with-newlib",
                             "--with-as=#{Formula["i386-jos-elf-binutils"].opt_prefix}/bin/i386-jos-elf-as",
                             "--with-ld=#{Formula["i386-jos-elf-binutils"].opt_prefix}/bin/i386-jos-elf-ld",
                             "--without-headers",
                             "MAKEINFO=missing",
                             "--enable-languages=c"
      system "make", "all-gcc"
      system "make", "install-gcc"
      system "make", "all-target-libgcc"
      system "make", "install-target-libgcc"
    end
  end

  test do
    system "#{bin}/i386-jos-elf-gcc -v"
  end
end
