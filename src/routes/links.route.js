import { Router } from "express"
import { deleteUrl, getUrlId, openShortUrl, shorten } from "../controllers/links.controller.js"
import { validateAuth } from "../middlewares/validate.auth.js"

const linkRoute = Router()
linkRoute.post("/urls/shorten", validateAuth, shorten)
linkRoute.get("/urls/:id", getUrlId)
linkRoute.get("/urls/open/:shortUrl", openShortUrl)
linkRoute.delete("/urls/:id", validateAuth, deleteUrl)
export default linkRoute