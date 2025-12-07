resource_group = {
  rg1 = {
    name     = "rg-capston-dev-cin-001"
    location = "central india"

  }
}

key_vaults = {
  kv1 = {
    name                       = "capston-dev-kv"
    location                   = "centralindia"
    resource_group_name        = "rg-capston-dev-cin-001"
    tenant_id                  = "215650d6-bc81-4e8e-ad7a-3c3ff4c8af04" 
    sku_name                   = "standard"
    enable_rbac_authorization   = true
    soft_delete_retention_days = 7
    purge_protection_enabled   = false

    access_policies = [
      {
        tenant_id = "215650d6-bc81-4e8e-ad7a-3c3ff4c8af04"
        object_id = "f23c55d7-afcd-47d9-a22f-d798e33cf990" 

        key_permissions = [
          "Get", "List", "Create", "Delete", "Update", "Import", "Backup", "Restore", "Recover"
        ]
        secret_permissions = [
          "Get", "List", "Set", "Delete", "Recover", "Backup", "Restore"
        ]
        certificate_permissions = [
          "Get", "List", "Create", "Import", "Delete", "Update", "ManageContacts", "ManageIssuers", "Recover"
        ]
        storage_permissions = [
          "Get", "List", "Delete", "Set", "Update", "Recover", "RegenerateKey", "Backup", "Restore"
        ]
      }
    ]
  }
}
todomysqlserver01 = {
  sql_server1 = {
    resource_group_name          = "rg-capston-dev-cin-001"
    location                     = "central india"
    administrator_login          = "devops123"
    administrator_login_password = "Devops@1@3#5"
    name                         = "sql-server-capston-cin-001"
    version                      = "12.0"
    max_size_gb                  = 1
  }
}
sql_database = {
  sql_db1 = {
    name       = "sql-db-capston-cin-001"
    server_key = "sql_server1"
  }
}
