import http from 'http';
import dotenv from 'dotenv';
import app from './app';

const server = http.createServer(app);

dotenv.config();
const { PORT } = process.env;

const start = async () => {
  try {
    server.listen(PORT, () => {
      console.log(`MRDR 백엔드 서버가 ${PORT}번 포트에서 시작되었습니다.`);
    });
  } catch (error) {
    console.error(error);
  }
};

start();
