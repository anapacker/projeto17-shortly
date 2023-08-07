import { Router } from "express"
import { userSchemaValidation } from "../middlewares/validate.user.schema.js"
import { signin, signup } from "../controllers/user.controller.js"
import { validateAuth } from "../middlewares/validate.auth.js"

const userRouter = Router()
userRouter.post("/signup", userSchemaValidation, signup)
userRouter.post("/signin", signin)
userRouter.get("/users/me", validateAuth)

export default userRouter