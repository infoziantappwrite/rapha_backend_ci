# Rapha Health App - Backend (TypeScript + Express)

Minimal starter for an Express API written in TypeScript.

Quickstart:

1. copy `.env.example` to `.env` and update values.
2. install dependencies: `npm install`.
3. Run database migrations: `npx prisma generate`.
4. start dev server: `npm run dev`.
5. build: `npm run build`.
6. run tests: `npm test`.

Project layout:

- `src/` - application source
- `tests/` - jest tests
- `dist/` - compiled output (after build)

Endpoints:
- GET /api/v1/health - returns basic health info
