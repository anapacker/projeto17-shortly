import { Router } from "express"
import { getUrlId, openShortUrl, shorten } from "../controllers/links.controller.js"
import { validateAuth } from "../middlewares/validate.auth.js"

const linkRoute = Router()
linkRoute.post("/urls/shorten", validateAuth, shorten)
linkRoute.get("/urls/open/:shortUrl", openShortUrl)
linkRoute.get("/urls/:id", getUrlId)
export default linkRoute