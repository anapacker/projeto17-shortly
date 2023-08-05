import { Router } from "express"
import { userSchemaValidation } from "../middlewares/validate.user.schema.js"

const userRouter = Router()
userRouter.post("/signup", userSchemaValidation)
userRouter.post("/signin", userSchemaValidation)

export default userRouter