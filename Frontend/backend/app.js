const express = require('express');
const cors=require("cors");
const app =express();
const bodyParser = require("body-parser");
app.use(express.json());

app.use(bodyParser.json());
app.use(cors({
    origin: 'http://localhost:5173',
    methods: 'GET,HEAD,PUT,PATCH,POST,DELETE',
   }
));

const books=require("./Routes/BookRoute");

app.use("/dashboard", books);

module.exports= app;