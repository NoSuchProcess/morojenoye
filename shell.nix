{ pkgsRV ? import <nixpkgs> { crossSystem = "riscv64-linux"; }
, pkgsHS ? import <nixpkgs> { } }:

pkgsHS.mkShell { packages = [ pkgsRV.buildPackages.gcc ]; }
