---
layout: post
title: Google Compute Engine (GCE) Study Notes
date: 2017-01-29
---

Below are various notes and links that I have collected while going deep on
[Google Compute Engine](https://cloud.google.com/compute/). For an overview of
all the notes and this study adventure in general, the [GCP Study Plan]({%
post_url 2017-01-29-google-cloud-platform-gcp-study-plan %}) is a good start.

<!--more-->

1. [GCE Home](https://cloud.google.com/compute/)
1. [GCE Docs](https://cloud.google.com/compute/docs/)
1. [GCE Docs - Concepts](https://cloud.google.com/compute/docs/concepts)
1. Preemtible Instance
  1. Short lived
  1. Max life 24 hours
  1. Much cheaper pricing
  1. Can be terminated at anytime
  1. Configure a [shutdown script](https://cloud.google.com/compute/docs/shutdownscript) to
     gracefully handle instance termination
1. Custom Machine Types
  1. Choose custom vCPU and Memory VM configurations
  1. Feature allows you to scale vertically
  1. Configure VM to match application needs, best fit VM, no waste
