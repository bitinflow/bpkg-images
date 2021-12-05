FROM node:14-alpine AS build

WORKDIR /app
COPY runtimes/hello-world:latest/. /app

RUN set -ex \
  # Build JS-Application
  && npm install --production \
  # Delete unnecessary files
  && rm package* \
  # Correct User's file access
  && chown -R node:node /app

FROM node:14-alpine AS final
WORKDIR /app
COPY --from=build /app /app
ENV HTTP_PORT=8000
EXPOSE $HTTP_PORT $HTTPS_PORT
USER 1000
EXPOSE 8000
CMD ["node", "./index.js"]