resource "kubernetes_service" "webapi-nodeport" {
  metadata {
    name = "webapi-nodeport"
  }

  spec {
    selector = {
      name = "go-webapi"
    }

    port {
      port      = 5000
      node_port = var.webapi_nodeport
    }

    type = "NodePort"
  }
}

resource "kubernetes_deployment" "webapi-deployment" {
  metadata {
    name = "webapi-deployment"
  }

  spec {
    replicas = 3

    selector {
      match_labels = {
        name = "go-webapi"
      }
    }

    template {
      metadata {
        labels = {
          name = "go-webapi"
          env  = "Dev"
        }
      }

      spec {
        container {
          name  = "WebAPI-pod"
          image = "alhazmy20/webapi_test:latest"

          port {
            container_port = 5000
          }
        }
      }
    }
  }
}
