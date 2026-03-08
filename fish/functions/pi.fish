function pi

    set -f port 7356
    set -f host "192.168.0.170"
    if test "$argv[1]" = 2
        set -f port 7355
        set -f host "192.168.0.169"
    end
    if test (count $argv) -ge 2
        set -f host "webmalc.pw"
    end
    echo "connect $host -p $port"
    ssh pi@$host -p $port
end
