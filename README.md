
# How to run Keycloak in Azure with Docker?

Here is a tutorial on how to configure your docker image, upload it to dockerhub and deploy it to Azure Container Apps


## Authors

- [@giovaniflp](https://www.github.com/giovaniflp)


## Environment variables

Before configuring your docker image, turn on an azure container app to get the Application Url, to put in the KC_HOSTNAME variable of the Dockerfile, use a Hello World Image just to start the ACP.

Config the variable like this:

`KC_HOSTNAME=https://xxxxxxxxxxxxxxxx.azurecontainerapps.io`



## Deploying to Dockerhub

To deploy the Docker image, make the necessary configurations in the Dockerfile, such as database settings.

```bash
  docker build -t <your_dockerhub_user>/keycloak_azure:v1 .
```

This will create a docker image with your docker hub name, container name and container tag (or version)

```bash
  docker push <your_dockerhub_user>/keycloak_azure:v1
```

This command will push the image to your Dockerhub, where it will be available publicly or privately
## Screenshots

#### Creating the container

![App Screenshot](https://raw.githubusercontent.com/giovaniflp/keycloak-azure-deploy/refs/heads/main/Screenshot%20from%202024-11-08%2000-30-37.png)

#### Configuring container ingress

![App Screenshot](https://raw.githubusercontent.com/giovaniflp/keycloak-azure-deploy/refs/heads/main/Screenshot%20from%202024-11-08%2000-35-15.png)




## Finalization

By configuring the other necessary parameters when uploading to Azure, your container is ready to be created and accessed, where it will enter with the KC_BOOTSTRAP_ADMIN_USERNAME and KC_BOOTSTRAP_ADMIN_PASSWORD configured in the dockerfile.

![App Screenshot](https://raw.githubusercontent.com/giovaniflp/keycloak-azure-deploy/refs/heads/main/finally.png)
