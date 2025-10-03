# Watmarker GitOps

This repository contains GitOps configurations for deploying the **Watmarker** application using [ArgoCD](https://argo-cd.readthedocs.io/). It automates application delivery by continuously syncing Kubernetes manifests from this Git repository to your cluster.

![ArgoCD Deployment](https://github.com/brandoyts/watmarker-gitops/raw/master/assets/argocd.png "argocd deployment")

![App Sample](https://github.com/brandoyts/watmarker-gitops/raw/master/assets/app-sample.gif "app sample")

---

## 🧠 Architecture Overview

This project follows the **App of Apps** pattern in ArgoCD. A root application (`watmarker`) manages two environment-specific **ApplicationSets**:

- `staging`
- `production`

Each `ApplicationSet` dynamically generates ArgoCD Applications for:

- `api-gateway`
- `watermark` (core service)
- `web-app`

This structure makes it easy to scale environments, enforce consistent deployment patterns, and apply GitOps best practices.

---

## 📋 Prerequisites

- A running **Kubernetes cluster**
- `kubectl` installed and configured
- [ArgoCD](https://argo-cd.readthedocs.io/) installed on your cluster
- [Git](https://git-scm.com/) installed locally

> 💡 **Note:** The `infrastructure/` folder is **under development**. It will contain **Terraform** code to provision the necessary cloud infrastructure (e.g., VPC, nodes, networking) to run the Kubernetes cluster in a fully automated way.

---

## 🛠️ Planned Improvements

**To be done:**

- Add `infrastructure/` folder with Terraform for cluster provisioning
- Integrate **Secrets Manager** (e.g., SealedSecrets or SOPS) for better secret handling
- Expand support for **multi-region** or **multi-cluster** deployments
- Add monitoring stack (**Prometheus + Grafana**) integration
- Add **Ingress networking** to expose the web app service to the public
