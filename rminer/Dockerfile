FROM adoptopenjdk:8-jdk-hotspot

ADD RefactoringMiner /opt/rminer-src

WORKDIR /opt/rminer-src

# Build refactoring miner distribution
RUN ./gradlew distZip
# install unzip
RUN apt-get update && apt-get install -y unzip
# Unzip binary to /opt/RefactoringMiner
RUN mv ./build/distributions/RefactoringMiner.zip /opt \
    && unzip /opt/RefactoringMiner.zip -d /opt/

WORKDIR /workspace

ENTRYPOINT ["/opt/RefactoringMiner/bin/RefactoringMiner"]