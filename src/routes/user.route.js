import { Router } from "express"
import { userSchemaValidation } from "../middlewares/validate.user.schema"

const userRouter = Router()
userRouter.post("/signup", userSchemaValidation)
userRouter.post("/signin", userSchemaValidation)