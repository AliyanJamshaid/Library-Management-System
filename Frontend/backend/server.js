const dotenv=require('dotenv');
dotenv.config({path: "backend/config/config.env"});
const app= require('./app');
const pool= require('./db');


pool.connect()
    .then(()=>{
        app.listen(process.env.PORT , ()=>{
            console.log(`Server running on PORT: ${process.env.PORT} in ${process.env.NODE_ENV} mode`)
        });
     })
    .catch((error)=>{
        console.error('Error Connecting to DataBase ⛔⛔⛔: ', error);
    });
