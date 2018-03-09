# https://docs.haskellstack.org/en/stable/nix_integration/#using-a-custom-shellnix-file
{ghc}:
with (import <nixpkgs> {});

haskell.lib.buildStackProject {
  inherit ghc;
  name = "anotherdayinmylife";
  buildInputs = [glpk pcre zlib];
}
