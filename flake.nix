{
  description = "st terminal";

  inputs.nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  inputs.flake-utils.url = "github:numtide/flake-utils";

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let pkgs = nixpkgs.legacyPackages.${system};
      in rec {
        packages = flake-utils.lib.flattenTree {
          st = pkgs.callPackage ./default.nix { };
        };
        defaultPackage = packages.st;
        apps.st = flake-utils.lib.mkApp {
          drv = packages.st;
          exePath = "/bin/st";
        };
        apps.default = apps.st;
        defaultApp = apps.st;
        devShell = pkgs.mkShell rec {
          name = "st";
          packages = with pkgs; [
            pkgconfig
            xorg.libX11
            xorg.libXft
            fontconfig
            harfbuzz
            gd
            glib
          ];
        };

      });
}
