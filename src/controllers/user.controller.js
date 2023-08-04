import { pg } from "pg"

export async function signup(req, res) {
    const { name, email, password } = req.body
    try {
        res.send(cadastro)
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