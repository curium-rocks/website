FROM node:lts-alpine as build-base
RUN apk add --update --no-cache \
  python3 \
  make \
  g++ \
  bash \
  gcc

FROM build-base AS build
WORKDIR /usr/src/app
COPY package*.json ./
RUN npm ci
COPY . .
COPY tsconfig.json .
RUN npm run build

FROM build-base AS libraries
WORKDIR /usr/src/app
COPY package*.json ./
RUN npm ci --omit=dev

FROM node:lts-alpine
RUN apk add --update --no-cache dumb-init
ENV NODE_ENV production
USER node
WORKDIR /usr/src/app
COPY --chown=node:node --from=libraries /usr/src/app/node_modules /usr/src/app/node_modules
COPY --chown=node:node --from=build /usr/src/app/public /usr/src/app/public
COPY --chown=node:node --from=build /usr/src/app/.next/standalone ./
COPY --chown=node:node --from=build /usr/src/app/.next/static ./.next/static

ENV PORT 3000
EXPOSE 3000
CMD ["dumb-init", "node", "server.js"]