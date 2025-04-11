{
  description = "kevin's neovim config";

  inputs = {
    flake-parts.url = "github:hercules-ci/flake-parts";
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = inputs @ {flake-parts, ...}:
    flake-parts.lib.mkFlake {inherit inputs;} {
      systems = ["x86_64-linux" "aarch64-linux" "aarch64-darwin" "x86_64-darwin"];
      perSystem = {
        config,
        self',
        inputs',
        pkgs,
        system,
        ...
      }: let
        runtimeDeps = with pkgs; [
          hello
          gcc
        ];
        /*
        nixpkgs.wrapNeovimUnstable is a function which takes two arguments:
        a neovim packaged
        an attribute set which specifies any other configuration
        */
        nvim = pkgs.wrapNeovimUnstable pkgs.neovim-unwrapped (
          pkgs.neovimUtils.makeNeovimConfig {
            customRC = ''
              set runtimepath^=${./.}
              lua dofile("${./.}/init.lua")
            ''; # A custom .vimrc file for the new neovim configuration
          }
          // {
            wrapperArgs = [
              "--prefix"
              "PATH"
              ":"
              "${pkgs.lib.makeBinPath runtimeDeps}"
            ]; # See https://nixos.org/manual/nixpkgs/stable/#fun-makeWrapper
          }
        );
      in {
        packages = rec {
          default = nvim;
          neovim = default;
        };
      };
    };
}
