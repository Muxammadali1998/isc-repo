variable "do_token" {
  sensitive = true
}

variable "name" {
  type = string
  default = "my"
}
variable "server-count" {
  type = number
  default = 1
}
variable "ssh-key" {
  sensitive = true
}