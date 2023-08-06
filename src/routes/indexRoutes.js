import { Router } from "express";
import userRouter from "./userRoute.js";
import linkRoute from "./links.route.js"

const router = Router()
router.use(userRouter)
router.use(linkRoute)
export default router