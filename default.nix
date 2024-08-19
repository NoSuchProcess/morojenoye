{ pkgs ? import <nixpkgs> { } }:
let
  ubootOverride = rec {
    src = pkgs.fetchurl {
      url = "https://ftp.denx.de/pub/u-boot/u-boot-${version}.tar.bz2";
      hash = "sha256-9ZHamrkO89az0XN2bQ3f+QxO1zMGgIl0hhF985DYPI8=";
    };
    extraConfig = "CONFIG_CMD_ELF_FDT_SETUP=y";
    version = "2024.07";
  };
in pkgs.linkFarm "morojenoye" [
  {
    name = "riscv64";
    path = pkgs.symlinkJoin {
      name = "morojenoye-riscv64";
      paths = let pkgs = import <nixpkgs> { crossSystem = "riscv64-linux"; };
      in [ (pkgs.ubootQemuRiscv64Smode.override ubootOverride) ];
    };
  }
  {
    name = "aarch64";
    path = pkgs.symlinkJoin {
      name = "morojenoye-aarch64";
      paths = let pkgs = import <nixpkgs> { crossSystem = "aarch64-linux"; };
      in [ (pkgs.ubootQemuAarch64.override ubootOverride) ];
    };
  }
]
