function pyenv
    set command $argv[1]
    set -e argv[1]

    switch "$command"
        case activate deactivate rehash shell
            . (pyenv "sh-$command" $argv | psub)

        case \*
            command pyenv "$command" $argv
    end
end
