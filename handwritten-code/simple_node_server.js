const http = require("http");
const url = require("url");

const server = http.createServer(function (req, res) {
  res.setHeader("Access-Control-Allow-Origin", "*");
  res.setHeader("Set-Cookie", ["max-age=10"]);

  let params = queryParse(url.parse(req.url).query);
  if (params.type === "ajax") res.end("That's an ajax request !");
  if (params.type === "jsonp")
    setTimeout(() => {
      res.end(`${params.callback}("That's a jsonp request !")`);
    }, 6000);
  else res.end("hello there!");
});
server.listen(8888);

function queryParse(query) {
  if (!query) return;
  let arr = query.split("&");
  let params = {};
  arr.forEach((e, i) => {
    let kv = e.split("=");
    params[kv[0]] = kv[1];
  });
  return params;
}
