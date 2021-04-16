path "kv/apps/web" {
  capabilities = ["create", "read","update", "delete", "list"]
}

path "kv/apps/application*" {
  capabilities = ["create", "read","update", "delete", "list"]
}
