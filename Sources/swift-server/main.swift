import PerfectHTTP
import PerfectHTTPServer
import PerfectLib

var routes = Routes()

routes.add(method: .get, uri: "/") { (request, response) in
  Log.debug(message: "Params: \(request.params())")
  response.setHeader(.contentType, value: "application/json")
  response.appendBody(string: "{\"message\": \"Hello World\"}")
    .completed()
}

routes.add(method: .post, uri: "/") { (request, response) in
  do {
    try response.setBody(json: request.json).completed()
  } catch {
    Log.error(message: "\(error)")
    Log.terminal(message: "Unable to send JSON back")
  }
}

do {
  // Launch HTTP Server
  try HTTPServer.launch(
    .server(name: "Example", port: 3000, routes: routes))
} catch {
  fatalError("\(error)")
}
