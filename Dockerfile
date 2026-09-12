FROM node:18-alpine

WORKDIR /app

# 安装依赖
COPY package*.json ./
RUN npm install --production

# 复制源码
COPY . .

EXPOSE 9763

CMD ["npm", "start"]
