{
  description = "Reusable GitHub Actions and Workflows";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    utils.url = "github:numtide/flake-utils";
  };

  outputs =
    {
      self,
      utils,
      nixpkgs,
    }:
    utils.lib.eachDefaultSystem (
      system:
      let
        pkgs = import nixpkgs { inherit system; };
      in
      {
        packages = with pkgs; { };
        devShell =
          with pkgs;
          mkShell {
            buildInputs = [
              git
              gh
              bun
              nixfmt-rfc-style
            ];
          };
      }
    );
}
