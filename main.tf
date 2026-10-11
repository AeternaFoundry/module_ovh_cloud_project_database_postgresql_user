resource "ovh_cloud_project_database_postgresql_user" "cloud_project_database_postgresql_users" {
  for_each = var.cloud_project_database_postgresql_users

  cluster_id     = each.value.cluster_id
  name           = each.value.name
  service_name   = each.value.service_name
  password_reset = each.value.password_reset
  roles          = each.value.roles

  dynamic "timeouts" {
    for_each = each.value.timeouts != null ? [each.value.timeouts] : []
    content {
      create = timeouts.value.create
      delete = timeouts.value.delete
      update = timeouts.value.update
    }
  }
}

