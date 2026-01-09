{ pkgs, config, lib, ... }:
{
  wayland.windowManager.sway = {
    enable = true;
    package = null; # sway installed by NixOS

    config = let
      mod = "Mod4";
    in {
      modifier = mod;
      terminal = "${pkgs.kitty}/bin/kitty"; # what do these defaults
      menu = "${pkgs.fuzzel}/bin/fuzzel";   # do in sway ?
      bars = [
        {
          position = "top";
          statusCommand = "i3status-rs config-top";
        }
      ];
      input = {
        "type:keyboard" = {
          xkb_options = "caps:escape";
        };
        "type:touchpad" = {
          natural_scroll = "enabled";
        };
      };
      keybindings = lib.mkOptionDefault {
        "Menu" = "exec fuzzel";
        "${mod}+space" = "exec fuzzel";

        "${mod}+comma" = "layout tabbed";
        "${mod}+period" = "layout splith";
        "${mod}+slash" = "layout splitv";

        "${mod}+tab" = "workspace back_and_forth";

        "XF86MonBrightnessUp" = "exec brightnessctl s 5%+";
        "XF86MonBrightnessDown" = "exec brightnessctl s 5%-";
        "${mod}+XF86MonBrightnessDown" = "exec brightnessctl s 1%"; # night mode
        "XF86AudioRaiseVolume" = "exec 'wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+ --limit 1.0'";
        "XF86AudioLowerVolume" = "exec 'wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-'";
        "XF86AudioMute" = "exec 'wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle'";
        "XF86AudioMicMute" = "exec 'wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle'";

        "Print" = "exec shotman --capture output";
        "shift+Print" = "exec shotman --capture region";
      };
      workspaceAutoBackAndForth = true;
    };
  };
  services.swayidle = let
    swaymsg = "${pkgs.sway}/bin/swaymsg";
  in
  {
    enable = true;
    timeouts = [
      { timeout = 300; command = "${swaymsg} 'output * dpms off'"; resumeCommand = "${swaymsg} 'output * dpms on'"; }
    ];
  };

  programs.i3status-rust = {
    enable = true;
    bars = {
      top = {
        blocks = [
          {
            block = "net";
            format = " $icon {$signal_strength $ssid|Wired connection} via $device ";
          }
          {
            block = "disk_space";
            path = "/";
            info_type = "available";
            interval = 60;
            warning = 20.0;
            alert = 10.0;
          }
          {
            block = "load";
            interval = 1;
            format = " $icon $1m.eng(w:4) ";

            info = 0.5;
            warning = 1.0;
            critical = 2.0;
          }
          { block = "sound"; }
          {
            block = "battery";
            format = " $icon $percentage ";
          }
          {
            block = "time";
            interval = 60;
            format = " $timestamp.datetime(f:'%a %d/%m %R') ";
          }
        ];
        icons = "material-nf";
      };
    };
  };

  ## software
  programs = {
    kitty = {
      enable = true;
      themeFile = "tokyo_night_night";
      settings = {
        shell = "${pkgs.fish}/bin/fish";
        font_size = 14.0;
        background_opacity = 0.9;
        confirm_os_window_close = 0;
      };
      keybindings = lib.mkOptionDefault {
        "shift+up" = "scroll_line_up";
        "shift+down" = "scroll_line_down";
        "shift+page_up" = "scroll_page_up";
        "shift+page_down" = "scroll_page_down";
      };
    };
    fuzzel.enable = true;
  };

  home.packages = with pkgs; [
    brightnessctl # media keys (brightness)
    shotman # screenshots
  ];
}
