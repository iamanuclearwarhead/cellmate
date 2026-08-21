# bash completion for cellmate

_cellmate() {
    local cur prev cmds packs_file packs
    cur="${COMP_WORDS[COMP_CWORD]}"
    cmds="add charge fly storage ir puffy note list show retire stats"

    if [ "$COMP_CWORD" -eq 1 ]; then
        COMPREPLY=($(compgen -W "$cmds" -- "$cur"))
        return
    fi

    packs_file="${XDG_DATA_HOME:-$HOME/.local/share}/cellmate/packs.tsv"
    packs=""
    [ -f "$packs_file" ] && packs="$(cut -f1 "$packs_file" | tr '\n' ' ')"

    case "${COMP_WORDS[1]}" in
        charge|fly|storage|ir|puffy|note|show|retire)
            [ "$COMP_CWORD" -eq 2 ] && COMPREPLY=($(compgen -W "$packs" -- "$cur"))
            ;;
        list)
            COMPREPLY=($(compgen -W "-a" -- "$cur"))
            ;;
    esac
}

complete -F _cellmate cellmate
