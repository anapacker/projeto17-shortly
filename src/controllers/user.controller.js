import { db } from "../database.js"
import bcrypt from "bcrypt"

export async function signup(req, res) {
    const { name, email, password } = req.body

    try {
        const user = await db.query(`SELECT * FROM users WHERE email=$1;`, [email])
        if (user.rowCount > 0) return res.status(409).send("E-mail já cadastrado.")
        const hashPassword = await bcrypt.hash(password, 10)

        await db.query(`
            INSERT INTO users (name, email, password)
            VALUES ($1, $2, $3);
            `, [name, email, hashPassword])
        console.log("ta chegando aqui tbm");
        res.sendStatus(201)
    } catch (err) {
        return res.status(500).send(err.message)
    }
}

export async function signin(req, res) {
    const { email, password } = req.body
    try {
        const login = await db.query(`SELECT * FROM users WHERE email=$1`, [email])
        if (!login) return res.status(404).send("Você não tem cadastro.")
        res.send(login)
    } catch (err) {
        return res.status(500).send(err.message)
    }
}