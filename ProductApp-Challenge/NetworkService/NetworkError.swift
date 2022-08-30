//
//  NetworkError.swift
//  ProductApp-Challenge
//
//  Created by Ivan Valero on 24/08/2022.
//

import Foundation

enum NetworkError: String, Error {
    case invalidURL
    case serializationFailed
    case generic
    case couldNotDecodeData
    case httpResponseError
    case statusCodeError = "ocurrió un error al tratar de cosultar el API: status code"
    case jsonDecoder = "Error al intentar extraer datos de json"
    case unauthorized
}

extension NetworkError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .invalidURL:
            return NSLocalizedString("Invalid URL", comment: "")
        case .serializationFailed:
            return NSLocalizedString("Failed to serialize the request", comment: "")
        case .generic:
            return NSLocalizedString("The app failed due to an unknown error, validate Api-Key", comment: "")
        case .couldNotDecodeData:
            return NSLocalizedString("Could not make the data decode", comment: "")
        case .httpResponseError:
            return NSLocalizedString("Impossible to get the HTTPResponse", comment: "")
        case .statusCodeError:
            return NSLocalizedString("Status code is different to 200", comment: "")
        case .jsonDecoder:
            return NSLocalizedString("failed to read the json and could not decode", comment: "")
        case .unauthorized:
            return NSLocalizedString("The session ended, re-starting", comment: "")
        }
    }
}
