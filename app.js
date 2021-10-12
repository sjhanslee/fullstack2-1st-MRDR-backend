import express from 'express';
import router from './routes';

const app = express();

app.use(express.json());
app.use(router);


app.use((e, req, res, next) => {
  res
    .status(e.status || 500)
    .json({
      error: e.message || '알수없는 오류가 발생했습니다 관리자에게 문의하세요.',
    });
});
// router.get('/ping', (req, res, next) => {
//   res.status(200).json({ message: 'pong' });
// });


// router.post('/cart', (req, res) => {
//   console.log(req.body);
//   res.json({
//     message: "hihihihi"
//   })
// })

export default app;
