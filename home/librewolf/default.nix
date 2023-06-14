_: {
  programs.librewolf = {
    enable = false;
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
      "x-scheme-handler/http" = ["brave.desktop"];
      "x-scheme-handler/https" = ["brave.desktop"];
      "x-scheme-handler/chrome" = ["brave.desktop"];
      "text/html" = ["brave.desktop"];
      "application/x-extension-htm" = ["brave.desktop"];
      "application/x-extension-html" = ["brave.desktop"];
      "application/x-extension-shtml" = ["brave.desktop"];
      "application/xhtml+xml" = ["brave.desktop"];
      "application/x-extension-xhtml" = ["brave.desktop"];
      "application/x-extension-xht" = ["brave.desktop"];
    };
  };
}
