import { JWT_TIMINGS, TOKEN_TYPES } from "../constants/jwt.constants";
import env from "../config/env";

import jwt, { SignOptions } from "jsonwebtoken";


class JWT {

    static generateToken(payload: object, type: TOKEN_TYPES, expiresIn: jwt.SignOptions['expiresIn']) {
        const secret = env.JWT_SECRET;
        
        const options: SignOptions = {
            expiresIn,
            audience: type,
        };
        
        return jwt.sign(payload, secret, options);
    }

    static generateAccessToken(payload: object) {
        return this.generateToken(payload, TOKEN_TYPES.ACCESS_TOKEN, JWT_TIMINGS.ACCESS_TOKEN_EXPIRES_IN);
    }

    static verifyAccessToken(token: string) {
        const secret = env.JWT_SECRET;
        return jwt.verify(token, secret, { audience: TOKEN_TYPES.ACCESS_TOKEN });
    }

    static generateRefreshToken(payload: object) {
        return this.generateToken(payload, TOKEN_TYPES.REFRESH_TOKEN, JWT_TIMINGS.REFRESH_TOKEN_EXPIRES_IN);
    }

    static verifyRefreshToken(token: string) {
        const secret = env.JWT_SECRET;
        return jwt.verify(token, secret, { audience: TOKEN_TYPES.REFRESH_TOKEN });
    }

}

export default JWT;