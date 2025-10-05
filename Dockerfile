FROM ghcr.io/anantacloud-oss/trivy:0.23.0

LABEL "com.anantacloud.image.name"="ghcr.io/anantacloud/trivy:0.23.0" \
      "com.anantacloud.image.description"="Trivy Docker Image" \
      "com.anantacloud.image.owner"="anantacloud"

RUN mkdir -p /apps/trivy

COPY "entrypoint.sh" "/apps/trivy/entrypoint.sh"

WORKDIR /apps/trivy

ENTRYPOINT ["/apps/trivy/entrypoint.sh"]
