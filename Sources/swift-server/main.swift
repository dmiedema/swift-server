import PerfectHTTP
import PerfectHTTPServer

var routes = Routes()

routes.add(method: .get, uri: "/") {_, res in
  res.setHeader(.contentType, value: "application/json")
  res.appendBody(string: "{\"message\": \"Hello World\"}")
    .completed()
}

do {
  // Launch HTTP Server
  try HTTPServer.launch(
    .server(name: "Example", port: 3000, routes: routes))
} catch {
  fatalError("\(error)")
}
