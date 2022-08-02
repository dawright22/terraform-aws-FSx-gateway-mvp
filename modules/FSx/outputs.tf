output "disk" {
  value = data.aws_storagegateway_local_disk.fsx
}

output "storage_gateway" {
  value = aws_storagegateway_gateway.myfsx
}
