1. Install SilverBullet with [Deno](https://silverbullet.md/Install/Deno)
2. `mkdir -p .config/systemd/user`
3. `nano .config/systemd/user/silverbullet.service`
4. Add content, where /Dokumenty/SilverBullet is the app data location:
```
[Unit]
Description=SilverBullet App Autostart
StartLimitIntervalSec=300
StartLimitBurst=5

[Service]
ExecStart=%h/.deno/bin/silverbullet %h/Dokumenty/SilverBullet
Restart=on-failure
RestartSec=1s
Environment=PATH=%h/.deno/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin

[Install]
WantedBy=default.target
```
5. systemctl --user enable silverbullet.service
6. systemctl --user restart silverbullet.service
