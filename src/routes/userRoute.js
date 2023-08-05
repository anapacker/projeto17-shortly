import { Router } from "express"
import { userSchemaValidation } from "../middlewares/validate.user.schema.js"
import { signin, signup } from "../controllers/user.controller.js"

const userRouter = Router()
userRouter.post("/signup", userSchemaValidation, signup)
userRouter.post("/signin")
userRouter.get("/signin", (req, res) => { res.send("deu certo") })

export default userRouter