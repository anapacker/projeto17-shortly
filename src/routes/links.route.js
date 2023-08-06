import { Router } from "express"
import { openShortUrl } from "../controllers/links.controller.js"

const linkRoute = Router()
linkRoute.post("/urls/shorten")
linkRoute.get("/urls/open/:shortUrl", openShortUrl)
export default linkRoute