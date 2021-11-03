# mvn clean package
# buildah bud -f src/main/docker/Dockerfile -t quay.io/jbride/fuse-location-service:0.0.1 .
# podman push quay.io/jbride/fuse-location-service:0.0.1

FROM registry.access.redhat.com/ubi8/openjdk-11:1.3

USER 1001
COPY target/*.jar /deployments/app.jar
