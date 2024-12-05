resource "local_file" "warpgate_address" {
  filename = "./warpgate_address"
  content  = huaweicloud_compute_instance.ecs_warpgate.access_ip_v4
}