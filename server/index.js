// Imports from packages
const express =  require('express')
const mongoose = require ('mongoose')

// imports from files
const authRouter = require('./routes/auth.js')

const PORT = 3000;
const DB = "mongodb+srv://samjhana:heymyappSam@cluster0.1soonog.mongodb.net/?retryWrites=true&w=majority"
const app = express();
app.use(express.json())

// middleware
app.use(authRouter);

// connection
mongoose.connect(DB).then(()=>
{
    console.log("connection successful");
})
.catch((e)=> {
    console.log(e);
})

app.listen(PORT, "0.0.0.0",()=>{
    console.log(`connected at port ${PORT}`)
})