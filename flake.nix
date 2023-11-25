# flake.nix
{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
  };

  outputs = { self, nixpkgs }:
    nixpkgs.legacyPackages."x86_64-linux".mkShell {
      buildInputs = [
        nixpkgs.texlive.combined.scheme-basic
      ];

      shellHook = ''
        mkdir -p $out/share/texmf/tex/latex/kaobook
        install -m444 $PWD/kaohandt.cls $out/share/texmf/tex/latex/kaobook/
        install -m444 $PWD/kaobook.cls $out/share/texmf/tex/latex/kaobook/
        install -m444 $PWD/kao.sty $out/share/texmf/tex/latex/kaobook/
        install -m444 $PWD/kaobiblio.sty $out/share/texmf/tex/latex/kaobook/
        install -m444 $PWD/kaorefs.sty $out/share/texmf/tex/latex/kaobook/
        install -m444 $PWD/kaotheorems.sty $out/share/texmf/tex/latex/kaobook/
        texhash $out/share/texmf
      '';
    };
}
