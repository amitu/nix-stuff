# Home

Install nix:

```bash
curl https://nixos.org/nix/install | sh
```

Install home manager:

```bash
nix-channel --add https://github.com/rycee/home-manager/archive/release-19.03.tar.gz home-manager
nix-channel --update
nix-shell '<home-manager>' -A install
```

Checkout this repo in ~/.config/nixpkgs.

Every time any changes are made in home.nix file, run:

```bash
home-manager switch
```

On server:

Clone this repo in /etc/nixos/

```bash
nix-channel --add https://github.com/rycee/home-manager/archive/release-19.03.tar.gz home-manager
nix-channel --update
```


```bash
nixos-rebuild switch
```
