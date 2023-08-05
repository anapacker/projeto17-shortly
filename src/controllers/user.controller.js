import { pg } from "pg"

export async function signup(req, res) {
    const { name, email, password } = req.body
    try {
        const user = await db.query(`SELECT * FROM users;`)
        if (user) return res.status(409).send("E-mail já cadastrado.")

        const insereUser = await db.query(`
            INSERT INTO users (name, email, password)
            VALUES ($1, $2, $3)
            `, [name, email, password])
        res.status(201).send(insereUser.rows[0])
    } catch (err) {
        return res.status(500).send(err.message)
    }
}

export async function signin(req, res) {
    const { email, password } = req.body
    try {
        res.send(login)
    } catch (err) {
        return res.status(500).send(err.message)
    }
}