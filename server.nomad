job "poe-server" {
  group "group-1" {
    task "api-server" {
      driver = "docker"

      # https://developer.hashicorp.com/nomad/docs/drivers/docker
      config {
        image      = "${IMAGE_TAG}"
        force_pull = true
        ports      = ["http"]
        # args     = ["python3", "-m", "poept.server", "--host", "0.0.0.0", "--port", "${NOMAD_PORT_http}"]
        args = ["tail", "-f", "/dev/null"]
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
