### How to use:
```bash
. ./start.sh
```

It will download Docker images, build the Jenkins image and start them all in a daemon mode in a virtual network in Docker.

#### After containers are built and started:

1. Set up Jenkins by navigationg to 
Jenkins UI:
* http://jenkins:8880/

you can view the jenkins admin password from logs by running
```bash
docker-compose logs jenkins
```
2. Proceed with the wizard and install Jenkins plugins; create first admin user.

##### Note: 
> In Jenkins you can reference Gitlab server by `gitlab` hostname instead of `localhost`.

3. Browse to the GitLab UI here (it takes a little while for Gitlab UI to get started after container is up and running):
* http://localhost:8929/

4. View the GitLab Grafana Metrics UI here:
* http://localhost:8929/-/metrics

HealthCheck Endpoints (get token from the gitlab http://localhost:8929/admin/health_check):
* http://localhost:8929/-/readiness?token={TOKEN}
* http://localhost:8929/-/liveness?token={TOKEN}
* http://localhost:8929/-/metrics?token={TOKEN}

5. Register the GitLab Shared Runner (run only once).
```bash
docker exec -it -e REGISTRATION_TOKEN={TOKEN} gitlab-runner register
docker-compose restart gitlab-runner
```

##### Note: 
> Containers have resource limits conifuged in the `docker-compose.yml` file.
