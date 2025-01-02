{
  description = "Ambiente de desarrollo python - postgres - docker";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem(system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
      in
      {
        devShell = pkgs.mkShell {
          buildInputs = with pkgs; [
            python313
            uv

            husky
            commitizen

            docker
            docker-compose

            openssl
            postgresql # to obtain libpq-dev
          ];
        };
      }
    );
}
