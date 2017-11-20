import PerfectHTTP
import PerfectHTTPServer
import PerfectLib
import PerfectRequestLogger

var routes = Routes()

routes.add(method: .get, uri: "/") { (request, response) in
  Log.debug(message: "Params: \(request.params())")
  do {
    try response.setBody(json: ["message": "👋 Hi"]).completed()
  } catch {
    Log.error(message: "\(error)")
    Log.terminal(message: "Unable to send JSON")
  }
}

routes.add(method: .post, uri: "/") { (request, response) in
  do {
    try response.setBody(json: request.json).completed()
  } catch {
    Log.error(message: "\(error)")
    Log.terminal(message: "Unable to send JSON back")
  }
}

// Create Request Logger
let requestLogger = RequestLogger()
// Create our Server
let server = HTTPServer.Server(name: "Swift Server",
                               port: 3000,
                               routes: routes,
                               requestFilters: [(requestLogger, .high)],
                               responseFilters: [(requestLogger, .low)])

do {
  // Launch HTTP Server
  try HTTPServer.launch(server)
} catch {
  fatalError("\(error)")
}
