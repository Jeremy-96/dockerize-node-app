import express from 'express';
import dotenv from 'dotenv';
import path from 'path';

dotenv.config();

const dirname = import.meta.dirname;
const app = express();
const port = process.env.PORT;

app.use('/static', express.static(`${dirname}/static`))

app.get('/', (req, res) => {
    res.sendFile(`${dirname}/templates/index.html`);
});

app.listen(port, () => {
    console.log(`Server listen on port ${port}`);
});