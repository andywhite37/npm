package npm.ws;

import haxe.extern.EitherType;

typedef VerifyClientInfo = {
  origin: String, // The value in the Origin header indicated by the client.
  req: js.node.http.IncomingMessage, // The client HTTP GET request.
  secure: Bool // true if req.connection.authorized or req.connection.encrypted is set.
};

typedef VerifyCallback = Bool -> Int -> String -> Void;

typedef DeflateOptions = {
  ?serverNoContextTakeover: Bool, // Whether to use context take over or not.
  ?clientNoContextTakeover: Bool, // The value to be requested to clients whether to use context take over or not.
  ?serverMaxWindowBits: Int, // TODO: confirm this... The value of windowBits.
  ?clientMaxWindowBits: Int, // TODO: again... The value of max windowBits to be requested to clients.
  ?memLevel: Int, // TODO: more... The value of memLevel.
  ?threshold: Int // TODO: Payloads smaller than this will not be compressed. Defaults to 1024 bytes.
};

// one of `port`, `server`, or `noserver` is required
typedef BaseOptions = {
  ?host: String, // The hostname where to bind the server.
  ?backlog: Int, // The maximum length of the queue of pending connections.
  ?verifyClient: EitherType<VerifyClientInfo -> Bool, VerifyClientInfo -> VerifyCallback -> Bool>, // A function which can be used to validate incoming connections.
  ?handleProtocols: Array<String> -> EitherType<Bool, String>, // A function which can be used to handle the WebSocket subprotocols.
  ?path: String, // Accept only connections matching this path.
  ?clientTracking: Bool, // Specifies whether or not to track clients.
  ?perMessageDeflate: EitherType<Bool, DeflateOptions>, // Enable/disable permessage-deflate.
  ?maxPayload: Int, // The maximum allowed message size in bytes.
  ?callback: Void -> Void // TODO: check this... the documentation is lacking

};

typedef WebSocketServerOptionsWithPort = { > BaseOptions,
  port: Int, // The port where to bind the server.
  ?server: EitherType<js.node.http.Server, js.node.https.Server>, // A pre-created Node.js HTTP server.
  ?noServer: Bool // Enable no server mode.
};

typedef WebSocketServerOptionsWithServer = { > BaseOptions,
  ?port: Int, // The port where to bind the server.
  server: EitherType<js.node.http.Server, js.node.https.Server>, // A pre-created Node.js HTTP server.
  ?noServer: Bool // Enable no server mode.
};

typedef WebSocketServerOptionsWithNoServer = { > BaseOptions,
  ?port: Int, // The port where to bind the server.
  ?server: EitherType<js.node.http.Server, js.node.https.Server>, // A pre-created Node.js HTTP server.
  noServer: Bool // Enable no server mode.
};
