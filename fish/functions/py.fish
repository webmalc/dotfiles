function py
    set -q DOCKER_PYTEST_SERVICE; or set DOCKER_PYTEST_SERVICE web
    docker compose exec -T $DOCKER_PYTEST_SERVICE pytest --color=yes $argv
end
