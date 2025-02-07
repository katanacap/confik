{ pkgs, lib, config, inputs, ... }:

{
  # https://devenv.sh/packages/
  packages = [
      pkgs.curl
      pkgs.git
      pkgs.jq
      pkgs.just
      pkgs.tree
      # config.formatter
      pkgs.nodePackages.prettier
      pkgs.taplo

      pkgs.rustup
      pkgs.sccache
      pkgs.cargo-outdated
      pkgs.cargo-nextest
      pkgs.cargo-audit

      # pkgs.vault-bin
      # pkgs.ngrok
  ] ++ lib.optional pkgs.stdenv.isDarwin [
    pkgs.pkgsBuildHost.libiconv
    pkgs.pkgsBuildHost.darwin.apple_sdk.frameworks.Security
    pkgs.pkgsBuildHost.darwin.apple_sdk.frameworks.CoreFoundation
    pkgs.pkgsBuildHost.darwin.apple_sdk.frameworks.SystemConfiguration
  ];

  # https://devenv.sh/languages/
  languages.nix.enable = true;
  languages.rust.enable = true;

  env.RUSTC_WRAPPER = "${pkgs.sccache}/bin/sccache";
  # languages.rust.mold.enable = true;
}
