resource "kubernetes_pod_v1" "mysql-pod" {
  metadata {
    name = "mysql-pod"
    labels = {
      app = "mysql-pod"
    }
  }
  spec {
    container {
      name  = "mysql"
      image = "mysql:latest"
      env_from {
        config_map_ref {
          name = "mysql-config"
        }
      }
      port {
        container_port = 3306
      }
      volume_mount {
        name       = "mysql-persistent-storage"
        mount_path = "/var/lib/mysql"
      }
    }
    volume {
      name = "mysql-persistent-storage"
      persistent_volume_claim {
        claim_name = "mysql-pvc"
      }
    }
  }
}

resource "kubernetes_service_v1" "mysql-svc" {
  metadata {
    name = "mysql-svc"
  }
  spec {
    selector = {
      app = "mysql-pod"
    }
    port {
      port = 3306
      target_port = 3306
      protocol = "TCP"
    }
  }
}

resource "kubernetes_persistent_volume_claim_v1" "mysql-pvc" {
  metadata {
    name = "mysql-pvc"
  }
  spec {
    resources {
      requests = {
        storage : "500Mi"
      }
    }
    access_modes = ["ReadWriteOnce"]
  }
}

resource "kubernetes_config_map_v1" "mysql-config" {
  metadata {
    name = "mysql-config"
  }
  data = {
    MYSQL_ROOT_PASSWORD = var.MYSQL_ROOT_PASSWORD
    MYSQL_DATABASE      = var.MYSQL_DATABASE
  }
}



