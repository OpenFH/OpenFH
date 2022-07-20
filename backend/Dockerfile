FROM node:alpine AS builder

# Create app directory
WORKDIR /app

# A wildcard is used to ensure both package.json AND package-lock.json are copied
COPY . .

# Install app dependencies
RUN yarn install
# Generate prisma client, leave out if generating in `postinstall` script
RUN yarn prisma generate

COPY . .

RUN yarn run build
RUN yarn install --force --production --ignore-scripts --prefer-offline

FROM node:alpine

COPY --from=builder /app/node_modules ./node_modules
COPY --from=builder /app/package*.json ./
COPY --from=builder /app/dist ./dist
COPY .env .env

EXPOSE 3000
CMD ["yarn", "start"]
