# fish completion for cellmate

function __cellmate_packs
    set -l packs "$XDG_DATA_HOME"
    test -n "$packs"; or set packs "$HOME/.local/share"
    set packs "$packs/cellmate/packs.tsv"
    if test -f $packs
        cut -f1 $packs
    end
end

set -l cmds add charge fly storage ir puffy note list show retire stats

complete -c cellmate -f
complete -c cellmate -n "not __fish_seen_subcommand_from $cmds" -a add -d 'add a new pack'
complete -c cellmate -n "not __fish_seen_subcommand_from $cmds" -a charge -d 'log a charge (counts a cycle)'
complete -c cellmate -n "not __fish_seen_subcommand_from $cmds" -a fly -d 'log a flight'
complete -c cellmate -n "not __fish_seen_subcommand_from $cmds" -a storage -d 'log putting the pack in storage'
complete -c cellmate -n "not __fish_seen_subcommand_from $cmds" -a ir -d 'log per-cell internal resistance'
complete -c cellmate -n "not __fish_seen_subcommand_from $cmds" -a puffy -d 'flag a pack as puffy'
complete -c cellmate -n "not __fish_seen_subcommand_from $cmds" -a note -d 'attach a note'
complete -c cellmate -n "not __fish_seen_subcommand_from $cmds" -a list -d 'list packs'
complete -c cellmate -n "not __fish_seen_subcommand_from $cmds" -a show -d 'pack details and history'
complete -c cellmate -n "not __fish_seen_subcommand_from $cmds" -a retire -d 'retire a pack'
complete -c cellmate -n "not __fish_seen_subcommand_from $cmds" -a stats -d 'fleet totals'
complete -c cellmate -n '__fish_seen_subcommand_from charge fly storage ir puffy note show retire' \
    -a '(__cellmate_packs)' -d 'pack'
complete -c cellmate -n '__fish_seen_subcommand_from list' -s a -d 'include retired packs'
