function mkplst
    ls -1 *.mp3 >"$(basename "$(pwd)").m3u"
end
