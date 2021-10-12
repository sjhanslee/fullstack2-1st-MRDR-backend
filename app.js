import express from 'express';
import router from './routes';

const app = express();

app.use(express.json());
app.use(router);

router.get('/ping', (req, res, next) => {
  res.status(200).json({ message: 'pong' });
});

export default app;
