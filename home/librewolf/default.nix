{...}: {
  programs.librewolf = {
    enable = true;
    settings = {
      "webgl.disabled" = false;
      "webgl.force-enabled" = true;
      "webgl.enable-webgl2" = true;
      "privacy.resistFingerprinting" = false;
      "browser.warnOnQuitShortcut" = false;
      "identity.fxaccounts.enabled" = false;
      "browser.sessionstore.resume_from_crash" = true;
      "privacy.resistFingerprinting.letterboxing" = false;
      "privacy.clearOnShutdown.history" = false;
      "privacy.clearOnShutdown.downloads" = true;
      "privacy.clearOnShutdown.cookies" = false;
      "security.OCSP.require" = false;
      "browser.toolbars.bookmarks.visibility" = "always";
      "browser.startup.homepage" = "http://dashboard.lab/";
    };
  };

  # enable librewolf as the default browser, with some extra config
  xdg.mimeApps = {
    enable = true;
    defaultApplications = {
      "x-scheme-handler/discord-409416265891971072" = ["discord-409416265891971072.desktop"];
      "x-scheme-handler/discord-402572971681644545" = ["discord-402572971681644545.desktop"];
      "x-scheme-handler/discord-696343075731144724" = ["discord-696343075731144724.desktop"];
      "x-scheme-handler/http" = ["librewolf.desktop"];
      "x-scheme-handler/https" = ["librewolf.desktop"];
      "x-scheme-handler/chrome" = ["librewolf.desktop"];
      "text/html" = ["librewolf.desktop"];
      "application/x-extension-htm" = ["librewolf.desktop"];
      "application/x-extension-html" = ["librewolf.desktop"];
      "application/x-extension-shtml" = ["librewolf.desktop"];
      "application/xhtml+xml" = ["librewolf.desktop"];
      "application/x-extension-xhtml" = ["librewolf.desktop"];
      "application/x-extension-xht" = ["librewolf.desktop"];
    };
  };
}
