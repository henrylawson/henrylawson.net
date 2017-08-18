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
1. [Preemtible Instance](https://cloud.google.com/preemptible-vms/)
  1. Short lived
  1. Max life 24 hours
  1. Much lower pricing
  1. Can be terminated at anytime
  1. Configure a [shutdown script](https://cloud.google.com/compute/docs/shutdownscript) to
     gracefully handle instance termination, save state to a Cloud Storage
     bucket
1. Compute Instances
  1. Instance States
      1. PROVISIONING - resources being reserved for instnaces
      1. STAGING - resources acquired, preparing for launch
      1. RUNNING - booting up or running, can ssh now
      1. STOPPING - instance being stopped or shutdown before being TERMINATED
      1. TERMINATED - has shutdown, can be deleted or restarted
  1. Instance Scheduling Options
      1. Triggered when their is a service disruption - hardware failure or
         maintenances
      1. Can Live Migrate move to another VM host and restart
      1. Terminate or optionally restart it at the new location
      1. Can be configured using availability policies onHostMaintenance and
         automicRestart
  1. Metadata available to instance via http requests
      1. Can long poll for changes
      1. Can store small amounts of Key Value info
      1. Can be used to "self discover" information for usage by the instance
  1. Serial console can be used to debug startup or boot issues
1. [Custom Machine Types](https://cloud.google.com/custom-machine-types/)
  1. Choose custom vCPU and Memory VM configurations
  1. Feature allows you to scale vertically
  1. Configure VM to match application needs, best fit VM, no waste
1. [Pricing](https://cloud.google.com/compute/pricing)
  1. Discount based model
  1. No lock in to legacy VM types
  1. Reduced priced based on usage period, sustained usage discounts
  1. Predefined machine types, treated as inferred instances for billing,
     allowing you to start and stop instances
  1. Algorithm is geared in customers favour, biggest discount possible
1. [Images](https://cloud.google.com/compute/docs/images)
  1. Multiple standard images
  1. Premium images, from supported vendors - extra cost
  1. Images are customized to run on Compute Engine
      1. Use Compute Engine repositories for RPM/DEB
      1. IP/Networking configuration tweaks
      1. Other tweaks detailed in docs
  1. Can import custom images from on-prem or other clouds
      1. Images can be stored under an image family so compute instance use
         latest
      1. Windows custom images not supported
      1. Setup bootloader, ensure SSH works, create image file, compress image
         file, upload it, setup Linux Guest Environment - for GCP features,
         configure for optimal GCP configuration, implement security bet
         practices
      1. [Image Management Best Practices](https://cloud.google.com/solutions/image-management-best-practices)
  1. Community images, not supported by GCP but by community
1. [Accessing Instances](https://cloud.google.com/compute/docs/instances/ssh-keys)
  1. Can manage SSH keys manually, be aware that keys will need to removed and
     cycled as the team members change, prefer using gcloud tool if manual keys
     are not needed
1. [Instance Groups](https://cloud.google.com/compute/docs/instance-groups/)
  1. Managed Instance Groups scale to the number of instances defined in the
     group, can sit behind a load balancer, use an instance template to define
     what instances should look like
  1. Unmanaged Instance Groups, for legacy applications that need to sit behind
     a load balancer but will be scaled and provisioned manually, snowflakes
     behind a Load Balancer
  1. Managed instance groups can use the Instance Group Updater, using various
     params to control how many minimum instances are maintained and max
     instances updated at any given time, updates can be canaries before
     rolling out, can be proactive - will actively update instances or
     opportunistic - will wait for instances to die or be scaled up or down by
     an autoscaler. Instance Group Updater can also do restarts or recreations
  1. Managed instance groups can be updated via rolling updates, they can be
     paused, continued, rolled back or cancelled
  1. Managed instance groups can have health checks applied to them
  1. Instances in a Managed instance group can be abandoned from the group to
     allow you to debug and tweak the services, they will also be removed from
     load balancers
  1. Detect and recreate unhealthy instances in the group
  1. Zonal vs. Regional, regional spans multiple zones in case of zone failure
  1. Tip, over provision regional managed instances to allow for the
     unavailability of one zone
  1. Tip, configure regional autoscaler to have higher max instances and lower
     target number to account for over provision for zone availability
  1. Managed instance groups can be used to deploy docker containers
  1. Autoscaling in a Managed Instance Group done via Autoscale Policy which
     can be based of Stackdriver metrics, CPU utilization, etc.
1. [Storage Options](https://cloud.google.com/compute/docs/disks/)
  1. Persistent disks, local SSDs, Cloud Storage Buckets, RAM disks
  1. Disks have different limits and performance characteristics
  1. Number of disks is dependent on vCPUs
1. [VM IP Addresses](https://cloud.google.com/compute/docs/vm-ip-addresses)
  1. Static external IP address - available for use by any instance in the
     project
  1. Ephemeral external IP addresses - assigned to an instance when started,
     released once it is terminated or restart
  1. Regional Static IP - can be assigned to an instance or network load balancer
  1. Global IP - used with HTTP(s) or SSL load balancing, not an instance
1. [Load Balancing and Autoscaling](https://cloud.google.com/compute/docs/load-balancing-and-autoscaling)
  1. HTTP(S) load balancing - cross region, can forward based on URL
  1. Network load balancing - single region, non-HTTP(s) services
1. [Global, Regional and Zonal](https://cloud.google.com/compute/docs/regions-zones/regions-zones)
  1. Assets fall into one of the above categories
  1. Zones are independent of each other, separate cooling, power, networking
     control panes
  1. Regions are collections of Zones
  1. Users can be restricted to certain quotes in different zones
1. [Identity Access Management](https://cloud.google.com/compute/docs/access/iam)
  1. Can create a custom service account to assign to an instance to allow it
     to access GCP services
  1. Instances provisioned with a default service account that allows read only
     access to some basic services, this can be deleted
1. Container VMs
  1. Container VMs allow running of docker containers through a definition in a
     YAML file when the compute engine is created
