//
//  HTTPRequest+Helpers.swift
//  swift-serverPackageDescription
//
//  Created by Daniel Miedema on 11/19/17.
//

import PerfectLib
import PerfectHTTP

extension HTTPRequest {
  /// Get the postBody[String|Data] as JSON if possible
  var json: JSONConvertible? {
    if let json = try? self.postBodyString?.jsonDecode() {
      return json
    }
    if let json = try? self.postBodyBytes?.jsonEncodedString().jsonDecode() {
      return json
    }
    return nil
  }
}

