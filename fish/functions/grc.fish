# fish implementation of https://github.com/zpm-zsh/colorize.
if type -q grc
    function env --wraps end
        grc --colour=auto env "$argv"
    end

    function lsblk --wraps lsblk
        grc --colour=auto lsblk "$argv"
    end

    function df --wraps df
        grc --colour=auto df -h "$argv"
    end

    function du --wraps du
        grc --colour=auto du -h "$argv"
    end

    function free --wraps free
        grc --colour=auto free -h "$argv"
    end

    function as -wraps as
        grc --colour=auto as "$argv"
    end

    if type -q dig
        function dig --wraps dig
            grc --colour=auto dig "$argv"
        end
    end

    if type -q gas
        function gas --wraps gas
            grc --colour=auto gas "$argv"
        end
    end

    if type -q gcc
        function gcc --wraps gcc
            grc --colour=auto gcc "$argv"
        end
    end

    if type -q g++
        function g++ --wraps g++
            grc --colour=auto g++ "$argv"
        end
    end

    if type -q last
        function last --wraps last
            grc --colour=auto last "$argv"
        end
    end

    if type -q ld
        function ld --wraps ld
            grc --colour=auto ld "$argv"
        end
    end

    if type -q ifconfig
        function ifconfig --wraps ifconfig
            grc --colour=auto ifconfig "$argv"
        end
    end

    if type -q mount
        function mount --wraps mount
            grc --colour=auto mount "$argv"
        end
    end
    fi

    if type -q mtr
        function mtr --wraps mtr
            grc --colour=auto mtr "$argv"
        end
    end

    if type -q netstat
        function netstat --wraps netstat
            grc --colour=auto netstat "$argv"
        end
    end

    if type -q ping
        function ping --wraps ping
            grc --colour=auto ping "$argv"
        end
    end

    if type -q ping6
        function ping6 --wraps ping6
            grc --colour=auto ping6 "$argv"
        end
    end

    if type -q ps
        function ps --wraps ps
            grc --colour=auto ps "$argv"
        end
    end

    if type -q traceroute
        function traceroute --wraps traceroute
            grc --colour=auto traceroute "$argv"
        end
    end
else
    function df --wraps df
        df -h "$argv"
    end

    function du --wraps du
        du -h "$argv"
    end

    function free --wraps free
        free -h "$argv"
    end
end
