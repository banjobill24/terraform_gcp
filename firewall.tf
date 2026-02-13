resource "google_compute_firewall" "lbg-firewall" {
  name = var.firewall_name
  network = var.network_name
  
  allow {
    protocol = "tcp"
    ports = ["22", "80", "3000", "5000"]
  }

  source_ranges = ["0.0.0.0/0"]
  target_tags = ["port-22", "http-server", "port-3000", "port-5000"]

  depends_on = [
    google_compute_network.lbg-network
  ]
}