# ECS deploy plugin for drone.io [https://hub.docker.com/r/joshdvir/drone-ecs-deploy/](https://hub.docker.com/r/joshdvir/drone-ecs-deploy/)

This plugin allows updating an ECS service.

## Usage

This pipeline will update the `my-cluster` cluster and `my-service` service with the image tagged `my-image:latest`

```yaml
  pipeline:
    deploy:
      image: joshdvir/drone-ecs-deploy
      cluster: my-cluster
      service: my-service
      image_name: my-image:latest
      aws_region: us-east-1
```

Another example with optional variables

```yaml
  pipeline:
    deploy:
      image: joshdvir/drone-ecs-deploy
      cluster: my-cluster
      service: my-service
      image_name: my-image:latest
      aws_region: us-east-1 # defaults to us-east-1
      timeout: "600" # defaults to 300 / 5 min
      max: "200" # defaults to 200
      min: "100" # defaults to 100
      pre_script_path: xxx/xxx/xxx.sh # to run a script before the deploy start
      aws_access_key_id: ewijdfmvbasciosvdfkl # optional, better to use as secret
      aws_secret_access_key: vdfklmnopenxasweiqokdvdfjeqwuioenajks # optional, better to use as secret
```

## Optional secrets

* AWS_ACCESS_KEY_ID
* AWS_SECRET_ACCESS_KEY

If no AWS_ACCESS_KEY_ID && AWS_SECRET_ACCESS_KEY the plugin will use the instance IAM role.
