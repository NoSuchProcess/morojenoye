{ pkgs ? import <nixpkgs> { crossSystem = "riscv64-linux"; } }:

pkgs.symlinkJoin {
  name = "morojenoye";
  paths = [ pkgs.ubootQemuRiscv64Smode ];
}
