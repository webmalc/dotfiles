function rx
    set -q argv[1]; and set target_path $argv[1]; or set target_path .
    repomix "$target_path" -o /tmp/code.txt
end
