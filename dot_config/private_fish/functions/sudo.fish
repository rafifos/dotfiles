# See: https://christitus.com/stop-using-apt#convert-apt-to-nala
function sudo --wraps sudo --description "Wraps SUDO(8), adding support for Nala(8)"
    if status --is-interactive; and type -q nala; and test "$argv[1]" = apt
        set --erase argv[1]
        command sudo nala $argv
    else
        command sudo $argv
    end
end
