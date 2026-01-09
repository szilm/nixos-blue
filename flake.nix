{
  description = "Generalized nixos config using numtide/blueprint";

  # Add all your dependencies here
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs?ref=nixos-unstable";

    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    # maps folder structure to flake outputs automagically
    blueprint.url = "github:numtide/blueprint";
    blueprint.inputs.nixpkgs.follows = "nixpkgs";

    # nix-darwin.url = "github:nix-darwin/nix-darwin";
    # nix-darwin.inputs.nixpkgs.follows = "nixpkgs";

    # DB for the nix index to allow cli suggestion
    nix-index-database.url = "github:nix-community/nix-index-database";
    nix-index-database.inputs.nixpkgs.follows = "nixpkgs";
  };

  # Load the blueprint
  outputs = inputs: inputs.blueprint { inherit inputs; };
}
