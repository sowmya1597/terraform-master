runtime                    = "java11"
deployment_artifact_url    = "https://storage.googleapis.com/my-bucket/myapp.jar"
cool_down_period           = "60s"
max_instances              = 10
min_instances              = 2
min_pending_latency        = "30ms"

env_variables = {
  "SPRING_PROFILES_ACTIVE" = "dev"
  "PORT"                   = "8080"
  "DATABASE_URL"           = "jdbc:thin//user:password@localhost/db"
} 



cpu_utilization = {
  target_utilization = 0.5
}
