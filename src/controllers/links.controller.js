import { nanoid } from "nanoid";
import { db } from "../database.js";

export async function shorten(req, res) {
    const { token } = req.headers
    const { url } = req.body
    const shortUrl = nanoid(10)

    if (!token) return res.sendStatus(401)
    try {
        const findUrl = await db.query(`
            SELECT * FROM "shortlyUrl" WHERE userId=$1 AND linkId=$2
        `, [id, url])
        if (findUrl.rowCount) {
            res.send({ id: findUrl.rows[0].id, shortUrl: findUrl.rows[0].shortLink })

        }

        await db.query(`
            INSERT INTO "shortlyUrl" ("userId", "linkId", "shortLink")
            VALUES ($1,$2,$3)
        `, [id, linkId, shortUrl])
        return res.status(201).send({ shortUrl: shortLink })
    } catch (err) {
        res.status(500).send(err.message)
    }
}

export async function openShortUrl(req, res) {
    try {

        res.redirect("https://google.com.br")
    } catch (err) {
        res.status(500).send(err.message)
    }
}
