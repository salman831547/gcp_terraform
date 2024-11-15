provider "google" {
  credentials = file(var.credentials_file)
  project     = var.project_id
  region      = var.region
}

resource "google_storage_bucket" "my_bucket" {
  name                        = var.bucket_name
  location                    = var.bucket_location
  force_destroy               = true
  storage_class               = var.storage_class
  uniform_bucket_level_access = true
}

variable "credentials_file" {
  description = "Path to the service account JSON key file"  
  type        = string
}

variable "project_id" {
  description = "Google Cloud project ID"
  type        = string
}

variable "region" {
  description = "Google Cloud region"
  type        = string
  default     = "us-central1"
}

variable "bucket_name" {
  description = "The name of the GCS bucket"
  type        = string
}

variable "bucket_location" {
  description = "Location for the GCS bucket (e.g., US, EU)"
  type        = string
  default     = "US"
}

variable "storage_class" {
  description = "Storage class for the GCS bucket (e.g., STANDARD, NEARLINE)"
  type        = string
  default     = "STANDARD"
}

