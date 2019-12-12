docker run -d \
  --network 'host' \
  -e REGISTRY_HTTP_ADDR=0.0.0.0:443 \
  -p 443:443 \
  --name registry-container \
  -v /srv/registry/data:/var/lib/registry \
  -v /srv/registry/security:/etc/security \
  -e REGISTRY_HTTP_TLS_CERTIFICATE=/etc/security/registry.crt \
  -e REGISTRY_HTTP_TLS_KEY=/etc/security/registry.key \
  registry:2
#   la config -p 5000:5000 ou -p 443:443 est d'office/implicite  avec   --network host
