# AWS Local DynamoDB Docker Image

This image runs AWS [local DynamoDB][aws]. It uses recent JRE 9 builds
which support setting JVM heap limits via cgroups. This ensures things
like `--memory` work correctly.

[aws]: http://docs.aws.amazon.com/amazondynamodb/latest/developerguide/DynamoDBLocal.html

## Usage

```
docker run -d --name dynamodb saltside/localdynamodb
```

You can provide a volume at `/data` to persist DynamoDB data.

```
docker run -d --name dynamodb -d -v /persistent/storage:/data saltside/localdynamodb
```
