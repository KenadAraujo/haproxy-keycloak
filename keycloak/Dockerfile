FROM quay.io/keycloak/keycloak:latest as builder

# Enable health and metrics support
ENV KC_HEALTH_ENABLED=true
ENV KC_METRICS_ENABLED=true

# Configure a database vendor
#ENV KC_DB=postgres

WORKDIR /opt/keycloak
# for demonstration purposes only, please make sure to use proper certificates in production instead
#RUN keytool -genkeypair -storepass password -storetype PKCS12 -keyalg RSA -keysize 2048 -dname "CN=server" -alias server -ext "SAN:c=DNS:localhost,IP:127.0.0.1" -keystore conf/server.keystore
RUN /opt/keycloak/bin/kc.sh build

FROM quay.io/keycloak/keycloak:latest
COPY --from=builder /opt/keycloak/ /opt/keycloak/

# change these values to point to a running postgres instance
#ENV KC_DB=postgres
ENV KC_DB_USERNAME=keycloak
ENV KC_DB_PASSWORD=password
#ENV KC_DB_URL=postgres://${KC_DB_USERNAME}:${KC_DB_PASSWORD}@postgres:5432/${KC_DB}
#ENV KC_HOSTNAME=postgres
ENTRYPOINT ["/opt/keycloak/bin/kc.sh","start-dev"]

#CMD [ "start --features=token-exchange \
#        --db-url=${KC_DB_URL} --db-username=${KC_DB_USERNAME} --db-password=${KC_DB_PASSWORD} \
#        --https-key-store-file=/opt/keycloak/conf/server.keystore --https-key-store-password=${KC_KEY_PASSWORD} --verbose" ]
