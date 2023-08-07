import { Router } from "express"
import { getUrlId, openShortUrl, shorten } from "../controllers/links.controller.js"
import { validateAuth } from "../middlewares/validate.auth.js"

const linkRoute = Router()
linkRoute.post("/urls/shorten", validateAuth, shorten)
linkRoute.get("/urls/:id", getUrlId)
linkRoute.get("/urls/open/:shortUrl", openShortUrl)
linkRoute.delete("/urls/:id")
export default linkRoute