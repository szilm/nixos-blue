### Unified nixos configurations for my stuff :3

Could be a little DRY-er but works on my machine (TM)

### Partitioning

1GB EFI Filesystem : NIXOS-BOOT
rest LVM PV : VG pool-primary
    (opt) swap == RAM size
    200+ GB ext4 : LV nixos-root

