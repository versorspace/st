{
  description = "st: Suckless Terminal";

  outputs = { self, nixpkgs }:
  let
    pkgs = nixpkgs.legacyPackages.x86_64-linux;
  in
  {
    packages.x86_64-linux.st = pkgs.callPackage (
      { lib, stdenv, fetchurl, libX11, libXft, fontconfig, freetype,
        harfbuzz, gd, glib, ncurses, pkg-config
      }:
        stdenv.mkDerivation rec {
          pname = "suckless-terminal";
          version = "0.9";
        
          src = ./.;
        
          buildInputs = [ libX11 libXft harfbuzz gd glib ncurses
	                  fontconfig freetype pkg-config ];

          preInstall = ''
            export TERMINFO=$out/share/terminfo
          '';

          makeFlags = [ "CC=${stdenv.cc.targetPrefix}cc" ];

	  installFlags = [ "PREFIX=$(out)" ];
	}
      ) {};

    packages.x86_64-linux.default = self.packages.x86_64-linux.st;

    devShells.x86_64-linux.default = pkgs.mkShell {
      packages = with pkgs; [
        xorg.libX11
	xorg.libXft
	fontconfig
	freetype
	pkg-config
	harfbuzz
	gd
	glib
	ncurses
      ];
    };
  };
}
