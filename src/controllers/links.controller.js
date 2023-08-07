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
    const { shortUrl } = req.params
    try {
        const link = await db.query(`SELECT url FROM "shortedUrls" WHERE "shortUrl"=$1`, [shortUrl])
        if (!link.rowCount) return res.status(404).send("Shortly não encontrado.")

        const originalLink = link.rows[0].url

        await db.query(`UPDATE "shortedUrls" SET "visitorsCount" + 1 WHERE "shortUrl"=$1`, [shortUrl])
        res.redirect(originalLink)
    } catch (err) {
        res.status(500).send(err.message)
    }
}

export async function deleteUrl(req, res) {
    const { id } = req.params
    const userId = req.headers.id

    try {
        const urlUserId = await db.query(`SELECT * FROM "shortedUrls" WHERE id=$1`, [id])
        if (!urlUserId.rowCount) return res.sendStatus(404)

        if (urlUserId.rows[0].id !== userId) return res.sendStatus(401)

        await db.query(`DELETE FROM "shortedUrls" WHERE id=$1`, [id])
        res.status(204).send(`Shortly excluído com sucesso!`)
    } catch (err) {
        res.status(500).send(err.message)
    }
}


