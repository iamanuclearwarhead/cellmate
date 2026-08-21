# [cellmate](https://github.com/iamanuclearwarhead/cellmate)

keep your lipos alive.

a tiny cli tool to track your fpv batteries cycles, internal resistance, flights, and which ones are getting puffy before they explode midair.

## why

lipos die quietly, cycles add up and the internal resistance increases. which is bad. cellmate remembers all of it and yells at you when a pack needs attention

- `PUFFY`: you flagged it swollen
- `high IR` or `IR rising`: cell over 15mΩ / 10mΩ
- `sitting full Nd`: last event was a charge 3+ days ago
- `150+ cycles`: its had a good life

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

tab completions for bash zsh and fish can be found in  `completions/` — copy the one for your shell:

```bash
# fish
cp completions/cellmate.fish ~/.config/fish/completions/

# bash
cp completions/cellmate.bash ~/.local/share/bash-completion/completions/cellmate

# zsh: drop completions/_cellmate anywhere in your $fpath
```

## data

everything is stored in two greppable tsv files under `~/.local/share/cellmate/` (`packs.tsv` and `events.tsv`). you can back them, up sync them, `awk` them

## license

mit. see [license](LICENSE) here

made with <3 and shell

fly safely

dont be afraid to fork
