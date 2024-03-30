{
  description = "Personal Flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-stable";
    nixpkgs-unstable.url = "github:nixos/nixpkgs?ref=nixos-unstable";

    darwin = {
      url = "github:LnL7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, nixpkgs-unstable }:
  let
    # const
    allSystems = [
      "x86_64-linux"
      "x86_64-darwin"
      "aamd64-linux"
      "aamd64-darwin"
    ];

    # lib
    forAllSystems = nixpkgs.lib.genAttrs allSystems
    
    # var
    system = "x86_64-linux";
    
  in {
    import 
  };
}