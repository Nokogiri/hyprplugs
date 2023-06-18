{
  lib,
  stdenv,
  hyprland,
  fetchFromGitHub
}:
stdenv.mkDerivation {
  pname = "hyprfocus";
  version = "0.1";
  src = fetchFromGitHub {
    owner = "VortexCoyote";
    repo = "hyprfocus";
    rev = "69f3f23e90f1b9a6525a860c19ad2b17762f45f3";
    hash = "sha256-Ay6bWvDPkbgoOzlfs9WS2gZZGfhvBay+0k+niXUuHb8=";
    #sourceRoot = "src";
  };

  #sourceRoot = "./src";
  patches = [
    ./meson.patch
  ];
  inherit (hyprland) nativeBuildInputs;

  buildInputs = [hyprland] ++ hyprland.buildInputs;

  #buildCommand = ''
  #  cd $src
  #  make all
  #'';

  meta = with lib; {
    homepage = "https://github.com/hyprwm/hyprland-plugins";
    description = "Hyprland window title plugin";
    license = licenses.bsd3;
    platforms = platforms.linux;
  };
}
