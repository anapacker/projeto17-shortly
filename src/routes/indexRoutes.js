import { Router } from "express";
import userRouter from "./userRoute.js";
import linkRoute from "./links.route.js"
import rankingRouter from "./ranking.route.js";

const router = Router()
router.use(userRouter)
router.use(linkRoute)
router.use(rankingRouter)
export default router