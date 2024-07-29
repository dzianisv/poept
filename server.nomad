job "poe-server" {
  group "group-1" {
    task "api-server" {
      driver = "docker"

      service {
        port = "http"
        check {
          type     = "http"
          name     = "app_health"
          path     = "/health"
          interval = "20s"
          timeout  = "5s"

          check_restart {
            limit           = 3
            grace           = "90s"
            ignore_warnings = false
          }
        }
      }

      # https://developer.hashicorp.com/nomad/docs/drivers/docker
      config {
        image      = "${IMAGE_TAG}"
        force_pull = true
        ports      = ["http"]
        args       = ["python3", "-m", "poept.server", "--host", "0.0.0.0", "--port", "${NOMAD_PORT_http}"]
      }

      env {
        POE_COOKIES = "${POE_COOKIES}"
      }
    }

    # Setup port mapping here
    # https://developer.hashicorp.com/nomad/docs/drivers/docker#using-the-port-map
    network {
      port "http" {}
      mode = "host"
    }
  }
}
