import http from 'http';
import app from './app';

const server = http.createServer(app);

const TEMP_PORT = 8000;

const start = async () => {
  try {
    server.listen(TEMP_PORT, () => {
      console.log(`MRDR 백엔드 서버가 ${TEMP_PORT}번 포트에서 시작되었습니다.`);
    });
  } catch (error) {
    console.error(error);
  }
};

start();
