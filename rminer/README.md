# Case study: Dockerize an open source tool

The exercise focuses on dockerizing a tool RefactoringMiner.
The tool is available at https://github.com/tsantalis/RefactoringMiner.

# Instructions

- base image that includes openjdk
- add RefactoringMiner to the container filesystem
- install unzip through a run command (apt-get update && apt-get install -y unzip)


# Final docker command
sudo docker run --rm \
        -v /home/bzafiris/docker-tutorial2/rminer/workspace:/workspace \
        rminer:latest -a retrofit master
