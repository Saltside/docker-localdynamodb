FROM openjdk:9-jre
MAINTAINER Adam Hawkins <adam@saltside.se>

# Create working space
WORKDIR /usr/src/dynamodb

# Default port for DynamoDB Local
EXPOSE 8000

# Get the package from Amazon
RUN wget -O /tmp/dynamodb_local_latest https://s3-us-west-2.amazonaws.com/dynamodb-local/dynamodb_local_latest.tar.gz && \
    tar xfz /tmp/dynamodb_local_latest && \
    rm -f /tmp/dynamodb_local_latest

# Add VOLUMEs to allow backup of config, logs and databases
VOLUME ["/data" ]

# Default command for image
ENTRYPOINT [ "/usr/bin/java", "-XX:+UnlockExperimentalVMOptions", "-XX:+UseCGroupMemoryLimitForHeap", "-Djava.library.path=.", "-jar", "DynamoDBLocal.jar", "-dbPath", "/data" ]

CMD ["-port", "8000"]
