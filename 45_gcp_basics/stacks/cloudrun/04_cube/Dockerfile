# syntax=docker/dockerfile:1.4
FROM node:22.11.0-bookworm AS builder

LABEL dockerfile.baseimage="node:22.11.0-bookworm" dockerfile.description="04_cube" dockerfile.stage="builder"

WORKDIR /scratch

RUN curl -sf -o /bin/node-prune https://gobinaries.com/tj/node-prune && chmod +x /bin/node-prune && /bin/node-prune

COPY package.json package-lock.json ./
# https://docs.npmjs.com/cli/v7/commands/npm-ci
RUN npm ci

COPY tsconfig.json tailwind.config.js postcssrc.config.json .postcssrc .parcelrc index.html favicon.ico ./
COPY og ./og
COPY public ./public
COPY src ./src

#RUN npm run lint
#RUN npm run test:coverage
RUN npm run build
RUN npm run build:css
#RUN npm run audit:production
RUN npm ci --only=production && npm cache clean --force

# prune the node_modules
#RUN /usr/local/bin/node-prune --verbose ./node_modules

FROM nginx:1.29.0 AS production
LABEL dockerfile.baseimage="nginx:1.29.0" dockerfile.description="04_cube" dockerfile.stage="production"

WORKDIR /work
COPY bootstrap.sh /work/bootstrap.sh

WORKDIR /usr/share/nginx/html
COPY --from=builder /scratch/dist ./
COPY --from=builder /scratch/public ./public

CMD ["/bin/sh", "-c", "/work/bootstrap.sh"]