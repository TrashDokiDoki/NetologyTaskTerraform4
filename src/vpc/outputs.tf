output "network_id" {
  value = yandex_vpc_network.this.id
}

output "subnet_id" {
  value = yandex_vpc_subnet.this.id
}

output "subnet" {
  value = yandex_vpc_subnet.this
}