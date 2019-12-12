docker run -d \
  --network 'host' \
  -p 5000:5000 \
  --name registry \
  -v /srv/registry/data:/var/lib/registry \
  -v /srv/registry/security:/etc/security \
  -e REGISTRY_HTTP_TLS_CERTIFICATE=/etc/security/registry.crt \
  -e REGISTRY_HTTP_TLS_KEY=/etc/security/registry.key \
  -e REGISTRY_AUTH=htpasswd \
  -e REGISTRY_AUTH_HTPASSWD_PATH=/etc/security/htpasswd \
  -e REGISTRY_AUTH_HTPASSWD_REALM='Registry Realm' \
  --restart always \
  registry:2
#   la config -p 5000:5000 est d'office/implicite  avec   --network host