import express from 'express';
import './dataUploader/dataUploader';

const app = express();
const router = express.Router();

app.use(express.json());

router.get('/ping', (req, res, next) => {
  res.status(200).json({ message: 'pong' });
});
app.use(router);

export default app;
