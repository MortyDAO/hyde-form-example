#docker rmi -f $(docker images -aq)
docker system prune
echo "If the problem persists, try go Docker Desktop, "Troubleshoot" then "Clean / Purge data"
