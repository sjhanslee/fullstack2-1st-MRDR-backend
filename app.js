import express from 'express';
import router from './routes';
import cors from 'cors';

const app = express();
app.use(cors());

app.use(express.json());

app.use(router);

app.use((err, req, res, next) => {
  res.status(err.status || 500).json({
    error: err.message || '알수없는 오류가 발생했습니다.',
  });
});

export default app;
