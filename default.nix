{ pkgs ? import <nixpkgs> { } }:

pkgs.linkFarm "morojenoye" [
  {
    name = "riscv64";
    path = pkgs.symlinkJoin {
      name = "morojenoye-riscv64";
      paths = let pkgs = import <nixpkgs> { crossSystem = "riscv64-linux"; };
      in [ pkgs.ubootQemuRiscv64Smode ];
    };
  }
  {
    name = "aarch64";
    path = pkgs.symlinkJoin {
      name = "morojenoye-aarch64";
      paths = let pkgs = import <nixpkgs> { crossSystem = "aarch64-linux"; };
      in [ pkgs.ubootQemuAarch64 ];
    };
  }
]
