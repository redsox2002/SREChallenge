resource "aws_elasticache_subnet_group" "elasticache_subnet_group" {
  name       = "tf-test-cache-subnet"
  subnet_ids = ["${aws_subnet.PrivateAZA.id}"]
}

resource "aws_elasticache_replication_group" "default" {
  replication_group_id          = "default"
  replication_group_description = "Redis cluster for SRE Challenge"

  node_type            = "cache.m4.large"
  port                 = 6379
  parameter_group_name = "default.redis4.0"

  automatic_failover_enabled = true

  subnet_group_name = "${aws_elasticache_subnet_group.elasticache_subnet_group.name}"

  number_cache_clusters = 2
}