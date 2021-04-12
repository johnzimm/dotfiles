## docker

    docker { images | import | build | commit | rmi | load | save }
    docker { history | tag }
    docker { ps | logs | inspect | events | port | top | stats | diff }
    docker { cp | export }

    docker ps -a
    docker images -a
    docker volume ls
    docker system df

    docker exec -it foo /bin/bash
    docker run -i -t --rm centos /bin/bash
    docker logs --tail 50 --follow --timestamps <container_name>

    docker images --format "{{.Repository}}:{{.Tag}}" | grep ':latest' | xargs -L1 docker pull;
    docker images | grep -v REPOSITORY | awk '{print $1}'| xargs -L1 docker pull 
