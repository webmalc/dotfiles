function pj

    if test "$argv[1]" = av
        cd /home/webmalc/Projects/azovland-hotel/
        source .venv/bin/activate.fish
    end
    # if test (count $argv) -ge 2
    #     set -f host "webmalc.pw"
    # end
    # echo "connect $host -p $port"
    # ssh pi@$host -p $port
end

complete -c pj -a av
