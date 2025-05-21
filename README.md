# 🌐 Personal Website with Terraform and GCP

This project showcases how to deploy a personal website using **Terraform** and host it on **Google Cloud Storage**.

This repository contains Terraform scripts to deploy a static personal website to **Google Cloud Storage (GCS)**. The project automates the creation of a **GCS bucket**, uploads website files (HTML, CSS, JS), and configures the bucket for static website hosting.

## Overview

This repository provides a Terraform-based solution to:

1. Deploy a **static website** on **Google Cloud Storage**.
2. Automate the setup of the **GCS bucket** with the appropriate configurations for hosting a static website.
3. Upload **HTML**, **CSS**, and **JavaScript** files to the GCS bucket.

## Prerequisites

Before deploying the website, make sure you have the following tools and accounts set up:

### 1. Google Cloud Account
   - You need a [Google Cloud account](https://cloud.google.com/free). If you don't have one, you can sign up for a free account.
   - Set up a **Google Cloud project** and ensure you have **billing enabled** for your project.

### 2. Google Cloud SDK
   - Install the [Google Cloud SDK](https://cloud.google.com/sdk) to interact with your Google Cloud resources from your terminal.
   - After installation, authenticate with your Google account by running:
     ```bash
     gcloud auth login
     ```

### 3. Terraform
   - Install [Terraform](https://www.terraform.io/downloads.html) on your machine. Terraform will be used to create and manage the infrastructure.

### 4. Service Account and Credentials
   - In your Google Cloud project, create a service account with the **Storage Admin** role. This will allow Terraform to manage the GCS bucket.
   - Download the **JSON key file** for the service account and keep it secure.

---

## Setup Guide:

Deploying the Website

Write Terraform Code-

Your Terraform files should:
Create a GCS Bucket

Make Bucket Public

Upload Files

Deployment Commands:
1. Initialize Terraform
Run the following command to initialize Terraform and download the necessary provider plugins:
**terraform init**
2. Plan the Deployment
Run the following command to preview the changes that will be made by Terraform:
**terraform plan**
This command will show you the resources that Terraform will create or modify in your Google Cloud project.

3. Apply the Terraform Plan
Once you are satisfied with the plan, apply it to create the resources in your Google Cloud project:
**terraform apply**
Terraform will prompt you for confirmation. Type yes to proceed, and it will create the GCS bucket and upload the website files.

4. Access Your Website
After the deployment is successful, Terraform will output the URL of live website. It will look like this:
**website_url = "http://<YOUR-BUCKET-NAME>.storage.googleapis.com"**
Visit this URL in your browser, and you should see your personal website live.

Managing the Website
1. Updating the Website
To update your website, simply modify the files (e.g., index.html, styles.css, script.js) in the repository. Then, run the following command to apply the changes:

**terraform apply**

Terraform will upload the updated files to your GCS bucket.

2. Destroying the Resources
If you want to remove the resources (e.g., GCS bucket and files), run:
**terraform destroy**

This will delete the GCS bucket and all the files in it.
