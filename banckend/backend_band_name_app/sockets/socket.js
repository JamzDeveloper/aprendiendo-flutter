const { io } = require("../index");

io.on("connection", (client) => {
  console.log("Client connected");

  client.on("disconnect", () => {
    console.log("user disconnected");
  });

  client.on("message", (payload) => {
    console.log(payload);
    io.emit("message", {
      admin: "new message",
    });
  });

  client.on("emit-message", (payload) => {
      console.log(payload);
    io.emit("new-message", payload);
  });
});
