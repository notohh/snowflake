{
  rustPlatform,
  fetchFromGitHub,
  ...
}:  
  rustPlatform.buildRustPackage rec {
    pname = "rustypaste-cli";
    version = "0.3.0";
    src = fetchFromGitHub {
      owner = "orhun";
      repo = pname;
      rev = "v${version}";
      sha256 = "sha256-GPQEo9nYcw2Xowh0f2fqj4Ya5kUApB4GSdaSZkVb4R0=";
    };
    cargoHash = "sha256-uwAiNrpObirtxGXaNz3prXFIygcf0b8t/Z9N99Gcrtk=";
  }