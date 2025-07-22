module "digitalocean-infra" {
  source = "../modules/digitalocan-infra"

  do_token = var.do_token
  ssh-key = file(var.ssh-key-path)
}