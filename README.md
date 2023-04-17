# GCP Cloud Run simple app with Flask uploader over HTTP/2

## Overview

A simple file upload using Flask and NGINX to test HTTP/2 on GCP Cloud Run

## Running with Docker

```bash
docker build -t http2-uploader .
docker run -it --rm -p8080:80 http2-uploader
```

Validate if it is using HTTP2 with 

> Note: you can't run this in your browser directly!

```
curl -vvi --http2-prior-knowledge http://localhost:8080
```

## Pushing to Cloud Run

- Push the image to your public registry, or GCP Arifact registry
- Deploy the image with http2 enabled

```
gcloud run deploy --image IMAGE_URL --use-http2
```
