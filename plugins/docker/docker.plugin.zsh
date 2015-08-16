drd() { docker rm $(docker ps -q -a); } # remove docker containers
dri() { docker rmi $(docker images -q); } # remove docker images
db() { docker build -t="$1" .; } # build a docker

alias dip="docker inspect --format '{{ .NetworkSettings.IPAddress }}'" # get ip address of container
alias dkd="docker run -d -P" # run a daemonized container
alias dki="docker run -t -i -P" # run interactive container
alias dklc='docker ps -l' # List last Docker container
alias dklcid='docker ps -l -q' # List last Docker container ID
alias dklcip='dip `dklcid`' # Get IP of last Docker container
alias dkps='docker ps' # List running Docker containers
alias dkpsa='docker ps -a' # List all Docker containers
alias dkrmac='docker rm $(docker ps -a -q)' # Delete all Docker containers
alias dkrmlc='docker-remove-most-recent-container' # Delete most recent (i.e., last) Docker container
alias dkrmui='docker rmi $(docker images | grep "^<none>" | awk "{print $3}")' # Delete all untagged Docker images
alias dkrmli='docker-remove-most-recent-image' # Delete most recent (i.e., last) Docker image
alias dkrmi='docker-remove-images' # Delete images for supplied IDs or all if no IDs are passed as arguments
alias dkideps='docker-image-dependencies' # Output a graph of image dependencies using Graphiz
alias dkre='docker-runtime-environment' # List environmental variables of the supplied image ID
alias dkelc='docker exec -it `dklcid` bash' # Enter last container (works with Docker 1.3 and above)

alias da_show='cat ~/custom/plugins/docker/docker.plugin.zsh'