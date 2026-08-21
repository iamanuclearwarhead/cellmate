# cellmate

keep your lipos alive. a tiny cli to track your fpv battery fleet — cycles, internal resistance, flights, and which packs are getting puffy — before they let you down midair.

> no database, no cloud, no electron. just bash and two tsv files in `~/.local/share/cellmate/`

## why

lipos die quietly. cycles add up, internal resistance creeps, a pack sits fully charged for a week and swells. cellmate remembers all of it so you dont have to, and yells at you when a pack needs attention:

- `PUFFY` — you flagged it swollen
- `high IR` / `IR rising` — worst cell over 15mΩ / 10mΩ
- `sitting full Nd` — last event was a charge, 3+ days ago (storage charge your packs!!)
- `150+ cycles` — its had a good life

## usage

```bash
cellmate add tattu-r-line -s 6 -c 1300 -C 150 -b Tattu   # new pack: 6S 1300mAh
cellmate charge tattu-r-line       # log a charge (counts a cycle)
cellmate fly tattu-r-line 4        # log a flight (4 minutes)
cellmate storage tattu-r-line      # back to storage voltage
cellmate ir tattu-r-line 8.2 8.5 8.1 8.9 8.4 8.6   # per-cell IR in mΩ
cellmate puffy tattu-r-line        # flag it swollen
cellmate note tattu-r-line "crashed into the gate again"
cellmate list                      # your fleet + warnings (-a includes retired)
cellmate show tattu-r-line         # full details and history
cellmate retire tattu-r-line       # o7
cellmate stats                     # fleet totals
```

## install

```bash
git clone https://github.com/iamanuclearwarhead/cellmate
cd cellmate
install -Dm755 cellmate ~/.local/bin/cellmate
```

> make sure `~/.local/bin` is on your `$PATH`

tab completions for bash, zsh, and fish live in `completions/` — copy the one for your shell:

```bash
# fish
cp completions/cellmate.fish ~/.config/fish/completions/
# bash
cp completions/cellmate.bash ~/.local/share/bash-completion/completions/cellmate
# zsh: drop completions/_cellmate anywhere in your $fpath
```

## data

everything lives in two greppable tsv files under `~/.local/share/cellmate/` (`packs.tsv` and `events.tsv`). back them up, sync them, `awk` them, whatever. no lock-in.

## license

mit. [license](LICENSE) here
made with <3 and shell
fly safe, storage charge your packs
