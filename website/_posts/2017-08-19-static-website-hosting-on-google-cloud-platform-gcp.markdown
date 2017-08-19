---
layout: post
title: Static Website Hosting on Google Cloud Platform (GCP)
date: 2017-08-19
---

Originally this blog was hosted on Amazon Web Services, using a [Amazon Simple
Storage Service (S3)](https://aws.amazon.com/s3/), [Amazon
CloudFront](https://aws.amazon.com/cloudfront/) and [Amazon
Route53](https://aws.amazon.com/route53/). I have now completed a migration to
Google Cloud Platform.

<!--more-->

Originally I had planned to use [Google Cloud Platform's (GCP)](https://cloud.google.com/) equivalent
services:

1. [Amazon Simple Storage Service (S3)](https://aws.amazon.com/s3/) with
   [Google Cloud Storage (GCS)](https://cloud.google.com/storage/)
1. [Amazon CloudFront](https://aws.amazon.com/cloudfront/) with [Google Cloud
   CDN](https://cloud.google.com/cdn/)
1. [Amazon Route53](https://aws.amazon.com/route53/) with [Google Cloud
   DNS](https://cloud.google.com/dns/)

However after exploring further I realised two things:

1. To use [Google Cloud CDN](https://cloud.google.com/cdn/), you need to use
   [Google Cloud Load Balancer
   (GCLB)](https://cloud.google.com/load-balancing/), which
   currently costs around USD $18 per month.
1. [Google Cloud CDN](https://cloud.google.com/cdn/) is not required when using
   [Google Cloud Storage (GCS)](https://cloud.google.com/storage/) as Google
   Cloud Storage leverages Google's caching network and your objects are cached
   close to your users as part of the service.

After discovering this, I realised that the CDN was not needed. I just needed
to point the DNS records of my domain to a Google Cloud Storage bucket.
However, I then realised that when using a custom DNS record in front of a
Google Cloud Storage bucket, only HTTP is supported, your content will not be
served over HTTPS - you can of course use a Google Cloud Load Balancer in front
of the bucket and use your own certificate, but HTTPS is not served when using
the CNAME solution.

Even though I do not have any sensitive content, I prefer to serve all my
content over HTTPS by default. Not being able to do that from a bucket was a
show stopper.

It didn't take long before I realised that the solution to serving a static
website on [Google Cloud Platform](https://cloud.google.com/) is to use [Google
Firebase Hosting](https://firebase.google.com/docs/hosting/).

[Google Firebase Hosting](https://firebase.google.com/docs/hosting/) provides
static content hosting via a global content delivery network using a firebase
domain or a custom domain, over HTTPS.

Using the firebase SDK, I had my static [Jekyll](https://jekyllrb.com/) blog
website deployed in seconds, serving over HTTPS on my own custom domain. With
firebase's genourous free tier, this blog will probably cost me nothing per
month, versus the few dollars it used to cost me per month on Amazon.

The final setup was:

1. [Google Domains](https://domains.google/) - Registrar for domain name
1. [DNS with Google
   Domains](https://domains.google/#/?features_activeEl=management-tools) - DNS
   provided by free if your registrar is Google Domains
1. [Google Firebase Hosting](https://firebase.google.com/docs/hosting/) -
   Static website hosting with global content delivery network (CDN)
