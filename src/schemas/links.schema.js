import Joi from "joi";

export const linkSchema = Joi.object({
    url: Joi.string().required(),
    shortlyUrl: Joi.string().required()
})