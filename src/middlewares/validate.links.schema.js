import { linkSchema } from "../schemas/links.schema.js"


export function linkSchemaValidation(req, res, next) {

    const validationLink = linkSchema.validate(req.body, { abortEarly: false })
    if (validationLink.error) {
        const errors = validationLink.error.details.map((detail) => detail.message)
        return res.status(422).send(errors)
    }
    next()
}