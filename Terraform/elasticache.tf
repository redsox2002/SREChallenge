resource "aws_elasticache_replication_group" "default" {
  replication_group_id          = "default"
  replication_group_description = "Redis cluster for SRE Challenge"

  node_type            = "cache.m4.large"
  port                 = 6379
  parameter_group_name = "default.redis4.0"

  automatic_failover_enabled = true

  security_group_names = ["${aws_security_group.redis.name}"]

  number_cache_clusters = 2
}