import express from 'express';
import routes from './routes';

const app = express();

app.use(express.json()); // for parsing application/json (for POST, PUT, etc. stuff with req.body)
app.use(routes);

app.use((err, req, res, next) => {
  const { status, message } = err;
  console.error('ERROR HANDLER', err);
  res.status(status || 500).json({ message });
});

export default app;
