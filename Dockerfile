FROM node:16-alpine AS builder

WORKDIR /usr/app

COPY package.json .

RUN npm install --save-dev @testing-library/react

COPY . .

RUN npm run build

FROM nginx
COPY --from=builder /usr/app/build /usr/share/nginx/html
