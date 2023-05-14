variable "project_id" {
  type        = string
  description = "The GCP project ID"
}

variable "region" {
  type        = string
  description = "The GCP region"
}

variable "version_id" {
  type        = string
  description = "The version ID of the app"
}

variable "service_name" {
  type        = string
  description = "The name of the app service"
}

variable "runtime" {
  type        = string
  description = "The GCP runtime environment for the app"
}

variable "env_variables" {
  type        = map(string)
  description = "Environment variables to set for the app"
}

variable "deployment_artifact_url" {
  type        = string
  description = "The URL of the deployment artifact (e.g. JAR file)"
}

variable "cool_down_period" {
  type        = string
  description = "The cool-down period for scaling activities"
}

variable "cpu_utilization" {
  type        = map(string)
  description = "CPU utilization settings for scaling activities"
}

variable "max_instances" {
  type        = number
  description = "The maximum number of instances to run"
}

variable "min_instances" {
  type        = number
  description = "The minimum number of instances to run"
}

variable "min_pending_latency" {
  type        = string
  description = "The minimum pending latency for scaling activities"
}
