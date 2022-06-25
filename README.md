# **Udacity Cloud DevOps Engineer Capstone**

This is the final project of the course **Cloud DevOps Engineer**. Created by [Patrick Coutinho](https://www.linkedin.com/in/patrickcoutinho/).

---

## Project Details

Below we have the description of the tools and technologies used:

- **Frontend:** Simple project using `React` and `Next.js`.
- **Backend:** Project based on [Hackernoon post](https://hackernoon.com/how-to-build-microservices-in-nestjs).
- **Repository:** Monorepo using `yarn workspaces`, hosted on `Github`.
- **Cluster:** `Kubernetes` hosted on `EKS`. Created with `Cloudformation`. Deployed using `kubectl`.
- **Docker:** Projects containing their `Dockerfile` Used `docker-compose` for local development.
- **CI/CD:** Built on `CircleCI`. Contains pipeline with test steps, lint, build, `Docker` image creation, push of `Docker` images to `Docker Hub`, notifications in `Slack`, deploy `Kubernetes` and `Cloudfront`/`S3`, `make` recipes etc.
- **Deployment:** Blue/green type is used.
- **Screenshots**: See `screenshots` folder inside project.

---

## Prerequisites

- Docker
- Docker Compose
- Kubernetes
- Kubectl
- AWS cli and AWS account
- CircleCI account
- Redis Server
- Make

---

## Setup

1. Creating a Kubernetes Cluster on EKS and Frontend S3 and Cloudfront:

```shell
make create-eks-all
make create-frontend-all
```

2. Create a development branch.
3. Make any change and use [conventional commit](https://www.conventionalcommits.org/en/v1.0.0/) `feat` or `fix`.
4. Push changes to `Github` and merge to branch master.
5. See on `CircleCI` the workflows running.
6. Cleanup all created `Cloudformation` stacks after your tests.

---
## Local Development

With Docker:

```shell
make dev-docker
```

Without Docker:

```shell
make dev
```