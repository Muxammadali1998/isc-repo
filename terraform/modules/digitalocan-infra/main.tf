resource "digitalocean_droplet" "my-server" {
  count = var.server-count
  image   = "ubuntu-20-04-x64"
  name    = "${var.name}-srver${count.index}"
  region  = "ams3"
  size    =  "s-1vcpu-1gb"
  vpc_uuid = digitalocean_vpc.my-vpc.id
  ssh_keys = [digitalocean_ssh_key.my-server-ssh-key.id]
}
resource "digitalocean_ssh_key" "my-server-ssh-key" {
  name = "my-server-ssh-key"
  public_key = var.ssh-key
}
resource "digitalocean_vpc" "my-vpc" {
  name   = "${var.name}-test-vpc"
  region = "ams3"
  ip_range = "10.10.10.0/24"
}
resource "digitalocean_loadbalancer" "my-app-lb" {
  count = 0
  name = "${var.name}-app-lb"
  region = "ams3"
  vpc_uuid = digitalocean_vpc.my-vpc.id
  forwarding_rule {
    entry_port      = 80
    entry_protocol  = "http"
    target_port     = 80
    target_protocol = "http"
  }
  healthcheck {
    port     = 80
    protocol = "tcp"
  }
  droplet_ids = [
  for droplet in digitalocean_droplet.my-server : droplet.id
  ]
}