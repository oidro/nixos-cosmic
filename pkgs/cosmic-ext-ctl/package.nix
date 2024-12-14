{
  lib,
  fetchFromGitHub,
  rustPlatform,
  nix-update-script,
}:

rustPlatform.buildRustPackage {
  pname = "cosmic-ext-ctl";
  version = "0-unstable-2024-12-14";

  src = fetchFromGitHub {
    owner = "cosmic-utils";
    repo = "cosmic-ctl";
    rev = "604f65f5000f14cdad520889927e9288220cfcf8";
    hash = "sha256-n589fcjcwSMXpFTBgOXom09I8Mi8FbN7tM8zI66ewiE=";
  };

  cargoHash = "sha256-x41wYHb7vk2ern4MF7/VoFbwVt+baLb4Qb4aVXfzeGU=";

  passthru.updateScript = nix-update-script { };

  meta = with lib; {
    description = "CLI for COSMIC Desktop Environment configuration management";
    homepage = "https://github.com/cosmic-utils/cosmic-ctl";
    license = licenses.gpl3Only;
    maintainers = with maintainers; [
      # lilyinstarlight
    ];
    platforms = platforms.linux;
    mainProgram = "cosmic-ctl";
  };
}
