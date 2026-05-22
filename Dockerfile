# ใช้ Alpine หรือ Slim เพื่อลดขนาด Image จาก 1GB เหลือหลัก 100-200MB (บิวด์เร็วขึ้น Deploy ไวขึ้นมาก)
FROM node:20-slim

WORKDIR /app

COPY package*.json ./

# ใช้ npm ci (Clean Install) และ --only=production เพื่อไม่เอา devDependencies ขึ้นไปหนักบนเซิร์ฟเวอร์
RUN npm ci --only=production

COPY . .

# ตั้งค่า NODE_ENV เป็น production เพื่อความเร็วในการรันของ Node.js
ENV NODE_ENV=production

# ถึงแม้เราจะล็อกพอร์ตใน YAML ไว้ แต่ใส่ EXPOSE ไว้เป็นแนวทางเพื่อให้ gcloud รู้พอร์ตพื้นฐาน
EXPOSE 3000

CMD ["npm", "start"]
