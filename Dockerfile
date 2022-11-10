FROM node AS build
RUN mkdir /app
WORKDIR /app
COPY . .
RUN npm install
RUN npm run build --prod

#stage-2
FROM nginx
COPY --from=build /app/dist/class-45/ /usr/share/nginx/html/
