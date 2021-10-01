import express from 'express';

const app = express();
const router = express.Router();

router.get('/ping', (req, res, next) => {
  res.status(200).json({ message: 'pong' });
});
app.use(router);

export default app;
