import { db } from "../database.js";

export async function getRanking(req, res) {
    try {
        const users = await db.query(`SELECT id, name FROM users;`)
        const urls = await db.query(`SELECT * FROM "shortedUrls";`)
        let response = []

        users.rows.forEach(user => {
            const urlsDoUsuario = urls.rows.filter(shorted => {
                return shorted.userId === user.id
            })
            const linksCount = urlsDoUsuario.length
            let visitCount = 0

            for (let urlDoUsuario of urlsDoUsuario) {
                visitCount += urlDoUsuario.visitorsCount
            }
            response.push({ id: user.id, name: user.name, linksCount, visitCount })
        })
        response.sort((a, b) => { return b.visitCount - a.visitCount })
        response = response.slice(0, 10)

        return res.send(response)
    } catch (err) {
        return res.status(500).send(err.message)
    }
}