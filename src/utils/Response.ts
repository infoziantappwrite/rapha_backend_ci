import HTTP_STATUS from "../constants/enum/responseCodes.enum";
import envs from "../constants/enum/environments.enum";

import { Response } from "express";
const { version } = require('../../package.json');

type MetaResponse = {
    request_id: string;
    timestamp: string;
    version: string;
}

type ApiSuccessResponse<T = any> = {
    success: true;
    message: string;
    data: T | null;
    meta: MetaResponse;
    error: null;
}

type ApiErrorResponse<T = any> = {
    success: false;
    message: string;
    data: T | null;
    meta: MetaResponse;
    error: string | null;
}

class ApiResponse {

    private static generateMeta(): MetaResponse {
        return {
            request_id: crypto.randomUUID(),
            timestamp: new Date().toISOString(),
            version: version || "unknown"
        };
    }

    /**
     * success response
     * @param {Object} res - Express response object
     * @param {Number} status - HTTP status code, int, enum of HTTP_STATUS
     * @param {String} message - Success message
     * @param {Object} data - Response data
     */
    static success<T = any>(res: Response, status: HTTP_STATUS = HTTP_STATUS.OK, message: string = "Action completed successfully", data: T | null = null): Response<ApiSuccessResponse<T>> {
        return res.status(status).json({
            success: true,
            message: message,
            data,
            meta: this.generateMeta(),
            error: null
        });
    }

    /**
     * error response
     * @param {Object} res - Express response object 
     * @param {Number} status - HTTP status code, int, enum of HTTP_STATUS
     * @param {String} message - Error message
     * @param {Object} error - Error details
     */
    static error<T = any>(res: Response, status: HTTP_STATUS = HTTP_STATUS.INTERNAL_ERROR, message: string = "Internal server error", error: Error | null = null, data: T | null = null): Response<ApiErrorResponse<T>> {
        // ! add some logger framework here.
        console.log(`--- Encountered error in route ${res.req.originalUrl} ---`);
        if (status === HTTP_STATUS.INTERNAL_ERROR) {
            console.error(`[${new Date().toLocaleString()}] [${status}] ${message}`, error || "No error object provided");
        }
        else {
            console.warn(`[${new Date().toLocaleString()}] [${status}] ${message}`, error || "No error object provided");
        }
        console.log(`------`);

        if (error) {
            message = error.message || message;
        }

        return res.status(status).json({
            success: false,
            message: message,
            data,
            meta: this.generateMeta(),
            error: (process.env.NODE_ENV === envs.PROD) ? (error?.message || "") : (error?.stack || error || "No error object provided")
        });
    }

}

export default ApiResponse;