import { db } from "../database.js";

export async function shorten(req, res) {

    try {

        res.send("shorten")
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
