terraform{  
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "6.8.0"
    }
  }
}

provider "google" {
  credentials = "credentials.json"
  project     = "eastern-adapter-455005-c6"
  region      = "asia-south1"
  zone        = "asia-south1-c"
}

resource "google_compute_instance" "vm_instance" {
  name         = "management"
  machine_type = "e2-micro"
  tags = ["http-server", "https-server"]

  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-2004-lts"
    }
  }

  network_interface {
    network = "default"
    access_config {
    }
  }
}

#resource "google_compute_firewall" "ingress" {
  #name    = "ports"
  #network = "default" 
  #allow {
 #   protocol = "tcp"
    #ports    = ["22", "80", "443"]
 # }
 # source_ranges = ["0.0.0.0/0"]
 # target_tags = ["ssh", "http-server", "https-server"]
#}

