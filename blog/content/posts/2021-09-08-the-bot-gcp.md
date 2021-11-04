+++
title = "Review Bots - GCP"
date = "2021-09-08"
author = "Josh"
tags = ["github", "gcp", "terraform"]
+++

As mentioned in a previous post, I decided to deploy to GCP.

Here, I found a few options for running the bot and the model.

- [Google Kubernetes Engine](https://cloud.google.com/kubernetes-engine)
- [Google Functions](https://cloud.google.com/functions)
- [Google Cloud Run](https://cloud.google.com/run)

I experiemented with all 3 possible deployment targets, using [Terraform](https://www.terraform.io) to deploy the infrastructure.


## GKE

Configuring GKE in GCP is a really nice experience.

It was quite straight forward to setup the cluster with a couple of terraform resources - `google_container_cluster` and `google_container_node_pool`.

Then, I used the `kubernetes` provider in terraform to deploy the app using `kubernetes_service` and `kubernetes_deployment`.

The downside is the cost. As I was only running a handful of containers, it was a very inefficient use of money.

Nonetheless, it was a worthwhile exploration.

## Functions

I also tried Functions.

Functions allow you to deploy code to a container. Google has a [list](https://cloud.google.com/functions/docs/writing) of allowed programming languages and versions you can use.

This can be a quite nice way to get an API running without having the overhead of building and maintaining container images.

However, Functions only accept a single job at a time. If you have 100 customers who send a payload to your API, that will result in 100 separate Function instances being executed. This can be problematic if your code has a slow startup time.

## Cloud Run

Lastly, Cloud Run.

This option is in between GKE and Functions.

You need to create your own container image, but you only get charged for when a container is running.

The containers can accept multiple requests at a time, which has the potential for them to be even more cost effective.


### Logging & Alerts

I can't move on without talking about logging and alerts.

It's fantastic to see that logging and alerts can be so easily configured in GCP without having to deploy additional resources.

Just a few clicks and you can read the logs from Cloud Run, and a few more to create an alert.

---

## What did I do?

I ended up using Cloud Run because it gave me control over packaging all the dependencies I need into a container image, and it allows the bots to respond to multiple requests simultaneously.

You can learn more from other articles about when to choose Cloud Run, or Cloud Functions, and more details about how they work:

- [Cloud Run: What no one tells you about Serverless (and how it's done)](https://cloud.google.com/blog/topics/developers-practitioners/cloud-run-story-serverless-containers)
- [Cloud Run VS Cloud Functions: What’s the lowest cost?](https://medium.com/google-cloud/cloud-run-vs-cloud-functions-whats-the-lowest-cost-728d59345a2e)
- [Cloud Run and Cloud Function: What do I use? And Why?](https://medium.com/google-cloud/cloud-run-and-cloud-function-what-i-use-and-why-12bb5d3798e1)
