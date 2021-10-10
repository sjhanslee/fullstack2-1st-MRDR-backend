import express from 'express';
import { userController } from '../controllers';

const router = express.Router();

// router.get('/ping', (req, res, next) => {
//   res.status(200).json({ message: 'pong' });
// });
router.post('/login', userController.loginUser);

router.use((req, res, next) => {
  // DELETE?
  console.log('userRouter Time: ', Date.now());
  next();
});

export default router;
