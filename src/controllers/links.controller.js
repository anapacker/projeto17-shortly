import { nanoid } from "nanoid";
import { db } from "../database.js";

export async function shorten(req, res) {
    const { url } = req.body
    const shortUrl = nanoid(10)

    try {
        const findUrl = await db.query(`
            SELECT * FROM "shortedUrls" WHERE "userId"=$1 AND "url"=$2;
        `, [res.locals.userId, `${url}`])

        if (findUrl.rowCount) {
            res.send({ id: findUrl.rows[0].id, shortUrl: findUrl.rows[0].shortUrl })
            return
        }

        const responseInsert = await db.query(`
            INSERT INTO "shortedUrls" ("userId", "url", "shortUrl")
            VALUES ($1,$2,$3)
            RETURNING id;
        `, [res.locals.userId, url, `${shortUrl}`])

        return res.status(201).send({ id: responseInsert.rows[0].id, shortUrl })
    } catch (err) {
        res.status(500).send(err.message)
    }
}

export async function getUrlId(req, res) {
    const { id } = req.params
    try {
        const getshortUrl = await db.query(`
        SELECT id, "shortUrl", "url" FROM "shortedUrls" WHERE id=$1;`, [id])
        if (!getshortUrl.rowCount) return res.sendStatus(404)

        return res.status(200).send(getshortUrl.rows[0])
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

export async function deleteUrl(req, res) {
    try {

    } catch (err) {
        res.status(500).send(err.message)
    }
}


