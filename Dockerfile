FROM quay.io/keycloak/keycloak:latest as builder
# Keycloak Version = 26.0.5
# Date of deployment = 2024-11-07

ENV KC_HEALTH_ENABLED=true
ENV KC_METRICS_ENABLED=true

# Declare Database Type
ENV KC_DB=<YOUR_DB_TYPE>

WORKDIR /opt/keycloak

RUN keytool -genkeypair -storepass password -storetype PKCS12 -keyalg RSA -keysize 2048 -dname "CN=server" -alias server -ext "SAN:c=DNS:localhost,IP:127.0.0.1" -keystore conf/server.keystore

RUN /opt/keycloak/bin/kc.sh build

FROM quay.io/keycloak/keycloak:latest

COPY --from=builder /opt/keycloak/ /opt/keycloak/

# Database Connection
ENV KC_DB=<YOUR_DB_TYPE>
ENV KC_DB_URL=<YOUR_DB_URL>
ENV KC_DB_USERNAME=<YOUR_DB_USERNAME>
ENV KC_DB_PASSWORD=<YOUR_DB_PASSWORD>

# Azure Proxy Configuration and Hostname
ENV KC_HOSTNAME=<YOUR_AZURE_APPLICATION_URL>
ENV KC_PROXY_HEADERS=xforwarded
ENV KC_HTTP_ENABLED=true

# Keycloak Admin User, you can change the username and password
ENV KC_BOOTSTRAP_ADMIN_USERNAME=admin
ENV KC_BOOTSTRAP_ADMIN_PASSWORD=admin

ENTRYPOINT ["/opt/keycloak/bin/kc.sh"]

CMD ["start-dev"]
