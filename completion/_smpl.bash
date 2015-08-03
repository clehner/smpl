# smpl(1) completion                                       -*- shell-script -*-

_smpl_command()
{
    COMPREPLY=( $( compgen -W 'help card balance transactions account
        linked-accounts clean-cache ' -- "$cur" ) )
}

_smpl()
{
    local cur prev words cword split
    _init_completion -s || return

    local arg
    _get_first_arg
    if [[ -z $arg ]]; then
        if [[ "$cur" == -* ]]; then
            COMPREPLY=( $( compgen -W '$( _parse_help "$1" )' -- "$cur" ) )
        else
            _smpl_command
        fi
    else
        local args
        _count_args
        case $arg in
            help)
                case $args in
                    2)
                        _smpl_command
                        return
                        ;;
                esac
                ;;
            transactions)
                case "$prev" in
                    --format)
                        COMPREPLY+=($(compgen -W 'simple ledger' -- "$cur"))
                        compopt -o nospace
                        return
                        ;;
                    --since)
                        # expect integer number
                        COMPREPLY+=( $( compgen -P "$cur" -W "{0..9}" ) )
                        compopt -o nospace
                        return
                        ;;
                    *)
                        COMPREPLY=( $( compgen -W '$( _parse_help "$1" \
                            "help transactions")' -- "$cur" ) )
                        [[ $COMPREPLY == *= ]] && compopt -o nospace
                        ;;
                esac
                ;;
        esac
        COMPREPLY+=( $( compgen -W '$( _parse_help "$1")' -- "$cur" ) )
    fi

    return 0
} && complete -F _smpl smpl

# ex: ts=4 sw=4 et filetype=sh
