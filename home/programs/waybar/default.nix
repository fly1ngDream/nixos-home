{ config, lib, pkgs, ... }:
with lib;
let cfg = config.programs.waybar;
in {
  options.programs.waybar = {
    enable = mkEnableOption "Waybar";

    config = mkOption {
      type = types.attrs;
      default = {
        layer = "top";
        position = "top";
        height = 30;
        modules-left = [ "sway/workspaces" "sway/mode" "sway/window" ];
        modules-center = [ "clock" ];
        modules-right = [
          "custom/spotify"
          "backlight"
          "pulseaudio"
          "custom/keyboard"
          "network"
          "battery"
          "tray"
        ];
        "sway/mode" = {
          tooltip = false;
          format = ''<span weight="bold">{}</span>'';
        };
        "sway/window" = {
          tooltip = false;
          max-length = 50;
        };
        "custom/keyboard" = {
          exec =
            "$HOME/.cargo/bin/swaylayout --listen 1:1:AT_Translated_Set_2_keyboard";
        };
        "custom/spotify" = {
          format = " {}";
          max-length = 40;
          interval = 30;
          exec = "$HOME/bin/mediaplayer.py 2> /dev/null";
          exec-if = "pgrep spotify";
        };
        network = {
          tooltip = false;
          format-wifi = " {essid}";
          format-ethernet = "{ifname}: {ipaddr}/{cidr}";
          format-linked = "{ifname} (No IP)";
          format-alt = "{ifname}: {ipaddr}";
          format-disconnected = "No internet";
        };
        battery = {
          format = "{icon} {capacity}";
          format-charging = " {capacity}";
          states = {
            good = 100;
            warning = 30;
            critical = 15;
          };
          format-icons = [ "" "" "" "" ];
        };
        backlight = {
          format = "{icon} {percent}";
          format-icons = [ "" "" "" ];
        };
        pulseaudio = {
          tooltip = false;
          format = "{icon} {volume}";
          format-bluetooth = " {volume}";
          format-bluetooth-muted = " muted";
          format-muted = "muted";
          format-source = "{volume} ";
          format-source-muted = "";
          format-icons = {
            headphones = "";
            handsfree = "";
            headset = "";
            phone = "";
            portable = "";
            car = "";
            default = [ "" "" "" ];
          };
          on-click = "pavucontrol";
        };
        clock = {
          tooltip = false;
          format = "{:%a %d/%m | %H:%M}";
        };
        tray = {
          tooltip = false;
          spacing = 10;
        };
      };
      example = {
        layer = "top";
        modules-right = [ "network" "clock" ];
        clock = {
          tooltip = false;
          format = "{:%a, %d %b %H:%M}";
        };
      };
    };

    stylePath = mkOption {
      type = types.path;
      default = ./.config/waybar/style.css;
    };
  };

  config = mkIf cfg.enable {
    xdg.configFile."waybar/config".text = generators.toJSON { } cfg.config;
    xdg.configFile."waybar/style.css".source = cfg.stylePath;
    xdg.configFile."waybar/launch.sh".source = ./.config/waybar/launch.sh;
  };
}
