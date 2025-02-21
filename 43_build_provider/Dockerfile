# syntax=docker/dockerfile:1.11.0
FROM golang:1.23 AS builder

WORKDIR /scratch

RUN git clone https://github.com/hashicorp/terraform-provider-scaffolding-framework.git

ENV CGO_ENABLED=0 
RUN cd terraform-provider-scaffolding-framework && go install && go build

FROM hashicorp/terraform:1.10.5 AS terraform

COPY --from=builder /scratch/terraform-provider-scaffolding-framework/terraform-provider-scaffolding-framework /bin/terraform-provider-scaffolding-framework

ENV HOME=/root
COPY <<EOF /$HOME/.terraformrc
provider_installation {
  dev_overrides {
    "scaffolding" = "/bin/terraform-provider-scaffolding-framework"
  }
  direct {}
}
EOF

WORKDIR /scratch
COPY main.tf .
ENTRYPOINT [ "sh" ]
