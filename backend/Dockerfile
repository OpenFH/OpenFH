FROM node:alpine as builder

WORKDIR /usr/src/app

COPY . .

RUN yarn install 

RUN yarn prisma generate

RUN yarn build

EXPOSE 3000

CMD ["yarn", "start"]

# FROM node:alpine as production
# 
# ENV NODE_ENV=production
# 
# WORKDIR /usr/src/app
# 
# COPY package.json ./
# 
# RUN yarn install --production
# 
# RUN yarn prisma generate
# 
# COPY --from=builder /usr/src/app/dist ./dist
# 
# CMD ["node", "dist/main"]
