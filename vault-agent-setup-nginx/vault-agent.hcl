pid_file = "/home/ec2-user/vault-agent/pidfile"
exit_after_auth = false

auto_auth {
  method "aws" {
    mount_path = "auth/aws"
    config = {
      type = "iam"
      role = "app-role"
    }
  }

  sink "file" {
    config = {
      path = "/home/ec2-user/vault-agent/vault-token-via-agent"
    }
  }
}
cache {
  use_auto_auth_token = true
}

listener "tcp" {
  address = "127.0.0.1:8200"
  tls_disable = true
}

vault {
  address = "http://184.72.205.78:8200"
}

template {
  source      = "/home/ec2-user/vault-agent/customer.tmpl"
  destination = "/home/ec2-user/vault-agent/customer.txt"
}

template {
  source      = "/home/ec2-user/vault-agent/templates/ca.tmpl"
  destination = "/home/ec2-user/vault-agent/output/nginx.ca"
}

template {
  source      = "/home/ec2-user/vault-agent/templates/cert.tmpl"
  destination = "/home/ec2-user/vault-agent/output/nginx.cert"
}

template {
  source      = "/home/ec2-user/vault-agent/templates/key.tmpl"
  destination = "/home/ec2-user/vault-agent/output/nginx.key"
}

template {
  source      = "/home/ec2-user/vault-agent/templates/dbconfig.yml.tmpl"
  destination = "/home/ec2-user/vault-agent/output/dbconfig.yml"
}
