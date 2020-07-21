const WebSocket = require("ws");

const server = new WebSocket.Server({ port: 8080 });

server.on("open", function open() {
  console.log("connected");
});

server.on("close", function close() {
  console.log("disconnected");
});

let users = {};

server.on("connection", function connection(ws, req) {
  const ip = req.connection.remoteAddress;
  const port = req.connection.remotePort;
  const clientName = ip + port;

  users[clientName] = ws;
  console.log("%s is connected", clientName);

  // 发送欢迎信息给客户端
  ws.send("Welcome " + clientName);

  ws.on("message", function incoming(message) {
    console.log("用户列表", Object.keys(users));
    let msg = JSON.parse(message);
    console.log(msg.recipient);
    users[msg.recipient].send(msg.message);
  });
});
