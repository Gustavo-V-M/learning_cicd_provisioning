resource "local_file" "wireguard_domain_name" {
  content  = var.wireguard_domain_name
  filename = "wireguard_domain_name.txt"
}