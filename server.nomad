job "poe-server" {
  group "group-1" {
    task "http-server" {
      driver = "docker"

      # https://developer.hashicorp.com/nomad/docs/drivers/docker
      config {
        image      = "${IMAGE_TAG}"
        force_pull = true
        ports      = ["http"]
        args       = ["xfvb-run", "-a", "python3", "-m", "poept.langchain.server", "--host", "0.0.0.0", "--port", "${NOMAD_PORT_http}"]
      }

      env {
        POE_COOKIES = "${POE_COOKIES}"
      }
    }

    # Setup port mapping here
    # https://developer.hashicorp.com/nomad/docs/drivers/docker#using-the-port-map
    network {
      port "http" {}
    }
  }
}
