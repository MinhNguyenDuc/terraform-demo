data "google_service_account" gitlab_service_account {
    account_id = "gitlab@minhnd-devops.iam.gserviceaccount.com"
}

resource "google_compute_instance" "default" {
  name         = "test-vm"
  machine_type = "e2-medium"
  zone         = "asia-southeast1-a"

  tags = ["foo", "bar"]

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }

  network_interface {
    network = google_compute_network.vpc_network.id
    subnetwork = google_compute_subnetwork.subnet.id
  }

  metadata = {
    foo = "bar"
  }

  metadata_startup_script = file("./scripts/startup.sh")

  service_account {
    # Google recommends custom service accounts that have cloud-platform scope and permissions granted via IAM Roles.
    email  = data.google_service_account.gitlab_service_account.email
    scopes = ["cloud-platform"]
  }
}