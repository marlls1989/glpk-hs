with (import <nixpkgs> {}).pkgs;
let pkg = haskellngPackages.callPackage
            ({ mkDerivation, array, base, containers, deepseq, glpk, mtl
             , stdenv
             }:
             mkDerivation {
               pname = "glpk-hs";
               version = "0.3.4";
               src = ./.;
               buildDepends = [ array base containers deepseq mtl ];
               extraLibraries = [ glpk ];
               description = "Comprehensive GLPK linear programming bindings";
               license = stdenv.lib.licenses.bsd3;
             }) {};
in
  pkg.env
