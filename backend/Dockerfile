# Create base node image and install runtime environment
FROM node:alpine AS base
RUN apk update && apk add --no-cache python3 py3-pip build-base curl bash && curl -sfL https://install.goreleaser.com/github.com/tj/node-prune.sh | bash -s -- -b /usr/local/bin

# Install the dependencies
FROM base AS builder
WORKDIR /build
COPY package.json ./
RUN yarn install

# Build database
COPY prisma ./
RUN npx prisma generate

# Build the next project
COPY tsconfig.json tsconfig.build.json ./
COPY src/ ./src/
ENV NODE_ENV=production
RUN yarn build
RUN yarn bundle

# Clean node module folder for production
RUN npm prune --production --no-audit
RUN /usr/local/bin/node-prune

# Copy relevant files from builder and start the api
FROM node:alpine
WORKDIR /api

COPY --from=builder /build/node_modules/ ./node_modules/
COPY --from=builder /build/ecosystem-config.json/ /build/package/ ./

EXPOSE 3000
CMD [ "node_modules/.bin/pm2", "start", "ecosystem-config.json", "--no-daemon" ]
