var app = require("express")();
var http = require("http").Server(app);
var io = require("socket.io")(http, {
    cors: {
        origin: '*',
    }
});

app.get('/', (req, res) => {
    res.send("burası anasayfa");
});
io.on('connection', (socket) => {
    socket.on('new_appointment_create', () => {
        io.emit('admin_appointment_list');
    });
});

http.listen(4000, () => {
    console.log("Uçuşa hazırlanıyoruz");
});