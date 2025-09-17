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
        runtimeDeps = [
          pkgs.hello
          pkgs.gcc

          # needed for fzf
          pkgs.fzf
          pkgs.ripgrep

          # needed for blink
          pkgs.curl
          pkgs.git

          # for my notes
          pkgs.prettierd
          pkgs.markdown-oxide
          pkgs.typstyle
          pkgs.tinymist
          pkgs.websocat

          pkgs.lua-language-server
          pkgs.stylua
        ];
        /*
         * nixpkgs.wrapNeovimUnstable is a function which takes two arguments:
         * a neovim package
         * an attribute set which specifies any other configuration
         */
        nvim = pkgs.wrapNeovimUnstable pkgs.neovim-unwrapped (
          pkgs.neovimUtils.makeNeovimConfig {
            customRC = ''
              set runtimepath^=${./.}
              lua << EOF
                local config_path = "${./.}/lua"
                package.path = config_path .. "/?.lua;" .. config_path .. "/?/init.lua;" .. package.path
                dofile("${./.}/init.lua")
              EOF
            '';
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

          shellHook = ''
            export SHELL='${pkgs.mksh}/bin/mksh'
          '';
        };
      };
    };
}
