{ pkgs ? import
    (fetchTarball {
      name = "jpetrucciani-2026-05-07";
      url = "https://github.com/jpetrucciani/nix/archive/e0b8e206c1a2c3865dbd1f6bdadc6a3882c8c0d9.tar.gz";
      sha256 = "01mxpivbcwqb3vsx5yzkns56vgi7jwzwr9kg4l9zyhl3zhnliy7c";
    })
    { }
}:
let
  name = "polyglot-gateway";

  tools = with pkgs; {
    cli = [
      jfmt
      nixup
    ];
    java = [
      maven
      zulu25
      jdt-language-server
    ];
    scripts = pkgs.lib.attrsets.attrValues scripts;
  };

  scripts = with pkgs; { };
  paths = pkgs.lib.flatten [ (builtins.attrValues tools) ];
  env = pkgs.buildEnv {
    inherit name paths; buildInputs = paths;
  };
in
(env.overrideAttrs (_: {
  inherit name;
  NIXUP = "0.0.10";
})) // { inherit scripts; }
