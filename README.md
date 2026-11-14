# devops-capstone-project

A REST API for customer accounts (Flask + PostgreSQL) with the delivery pipeline around it: lint and tests in GitHub Actions, a container image, Kubernetes/OpenShift manifests, and a Tekton pipeline that deploys it.

Capstone for IBM's DevOps and Software Engineering certificate on Coursera. The service is small on purpose. What I cared about was getting it from `git push` to a running deployment with no manual steps.

[paste the status badge from Actions → Create status badge]

## Endpoints

| Method | Path | Description |
|---|---|---|
| GET | `/health` | Health check, used by the probes |
| POST | `/accounts` | Create an account |
| GET | `/accounts` | List accounts |
| GET | `/accounts/<id>` | Read one account |
| PUT | `/accounts/<id>` | Update an account |
| DELETE | `/accounts/<id>` | Delete an account |

[check against service/routes.py: fix paths, status codes, anything missing]

## Run it locally

```bash
[your actual Makefile targets, e.g. install, lint, test, run]
```

Database connection comes from [the env var your config reads]. [Say how you run Postgres locally.]

## Container and deploy

```bash
docker build -t [image-name] .
```

`deploy/` holds the manifests. `postgresql-ephemeral-template.json` is the OpenShift template I used for the database. It's ephemeral: data disappears when the pod restarts. Fine for a capstone, wrong for anything real (that needs a persistent volume or a managed database).

## Pipeline

**GitHub Actions** on every push and PR: [Python version], flake8, tests [with coverage: X%].

**Tekton** (`tekton/`): [list only the stages you built, in order].

## Notes

[2–3 real things that went wrong or took you time: a failing pipeline run and how you found the cause, a probe or permission problem on the cluster, a test that exposed a bug in your own code.]

## License

Apache 2.0, from the course template.
