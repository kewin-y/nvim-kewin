{
  description = "kevin's neovim config";

  inputs = {
    flake-parts.url = "github:hercules-ci/flake-parts";
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = inputs @ {flake-parts, ...}:
    flake-parts.lib.mkFlake {inherit inputs;} {
      systems = ["x86_64-linux" "aarch64-linux" "aarch64-darwin" "x86_64-darwin"];
      perSystem = {pkgs, ...}: let
        runtimeDeps = with pkgs; [
          hello
          gcc

          # needed for fzf
          fzf
          ripgrep

          # needed for blink
          curl
          git

          prettierd
          markdown-oxide

          lua-language-server
          stylua
        ];
        /*
        nixpkgs.wrapNeovimUnstable is a function which takes two arguments:
        a neovim packaged
        an attribute set which specifies any other configuration
        */
        nvim = pkgs.wrapNeovimUnstable pkgs.neovim-unwrapped (
          pkgs.neovimUtils.makeNeovimConfig {
            # LOL THANKS CHATGPT
            customRC = ''
              set runtimepath^=${./.}
              lua << EOF
                local config_path = "${./.}/lua"
                package.path = config_path .. "/?.lua;" .. config_path .. "/?/init.lua;" .. package.path
                dofile("${./.}/init.lua")
              EOF
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

        devShells.default = pkgs.mkShell {
          packages = with pkgs; [
            nixd
            alejandra
          ];
        };
      };
    };
}
