{
  description = "A very basic flake";

  inputs.nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";

  outputs = { nixpkgs, ... }:
    let
      pkgs = import nixpkgs { system = "aarch64-darwin"; };
      shell = pkgs.mkShell {
        description = "A development environement with go and nodejs";
        buildInputs = [
          pkgs.go
          pkgs.nodejs
        ];
      };
    in
    {
      devShells."x86_64-linux".default = shell;
      devShells."aarch64-linux".default = shell;
      devShells."x86_64-darwin".default = shell;
      devShells."aarch64-darwin".default = shell;
    };
}
