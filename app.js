import express from 'express';

const app = express();
const router = express.Router();

app.use(express.json());

router.get('/ping', (req, res, next) => {
  res.status(200).json({ message: 'pong' });
});
app.use(router);

import './dataUploader/dataUploader';

export default app;
