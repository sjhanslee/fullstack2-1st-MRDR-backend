import express from 'express';
import router from './routes';
// import './dataUploader/dataUploader';

const app = express();

app.use(express.json());
app.use(router);

app.use((err, req, res, next) => {
  console.error(err);
  res
    .status(err.status || 500)
    .json({ message: err.message || 'SERVER_ERROR' });
});

export default app;
