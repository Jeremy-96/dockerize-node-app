import express from 'express';

const app = express();

app.get('/', (req, res) => {
    res.send("Hello CLOUD RUN!");
});

app.listen(8080, () => {
    console.log("Server listen on port 8080");
});