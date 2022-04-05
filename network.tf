resource "google_compute_network" vpc_network {
    name = var.vpc_name
    auto_create_subnetworks = false
}

resource "google_compute_subnetwork" subnet {
  name          = var.subnet_name
  ip_cidr_range = "10.2.0.0/16"
  region        = var.singapore_region
  network       = google_compute_network.vpc_network.id
}

resource "google_compute_subnetwork" subnet_2 {
  name          = "subnet-2"
  ip_cidr_range = "10.1.0.0/16"
  region        = var.singapore_region
  network       = google_compute_network.vpc_network.id
}