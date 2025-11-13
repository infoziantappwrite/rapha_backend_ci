import express from 'express';
import helmet from 'helmet';
import cors from 'cors';
import cookieParser from "cookie-parser";
import 'express-async-errors';

import routes from './routes/index.route';
import notFound from './middleware/notFound.middleware';
import errorHandler from './middleware/errorHandler.middleware';

const app = express();

app.use(helmet());
app.use(cookieParser());

const allowedOrigins = ['http://localhost:5173', 'https://rapha-health.vercel.app'];

app.use(cors({
    origin: function (origin, callback) {
        if (!origin || allowedOrigins.indexOf(origin) !== -1) {
            callback(null, true);
        } else {
            callback(new Error('Not allowed by CORS'));
        }
    },
    methods: ['GET', 'POST', 'PUT', 'DELETE', 'OPTIONS'],
    allowedHeaders: ['Content-Type', 'Authorization', 'X-Requested-With', 'Accept'],
    credentials: true,
    maxAge: 86400 // 24 hours
}));
app.use(express.json());

const APIV1 = "/api/v1";

app.get("/", (req, res) => {
    res.send("Welcome to Rapha Health App Backend.");
});

app.use(`${APIV1}`, routes);

app.use(notFound);
app.use(errorHandler);

export default app;
