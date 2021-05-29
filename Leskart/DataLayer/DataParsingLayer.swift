//
//  DataParsingLayer.swift
//  Leskart
//
//  Created by Sai Kumar on 29/05/21.
//

import Foundation

enum ResponseFileName: String {
    case movies = "movies"
}


protocol DataParsingLayer {
    func getMoviesDetailsResponse() -> Movies?
}

extension DataParsingLayer {
    
    func getMoviesDetailsResponse() -> Movies? {
        return convertMockResponseToDataModel(responseType: .movies)
    }
    
    private func convertMockResponseToDataModel<Response: Decodable>(responseType: ResponseFileName) -> Response? {
        do {
            if let bundlePath = Bundle.main.path(forResource: responseType.rawValue, ofType: "json"), let jsonData = try String(contentsOfFile: bundlePath).data(using: .utf8) {
                let productDetailsModel = try JSONDecoder().decode(Response.self, from: jsonData)
                return productDetailsModel
            }
        } catch { }
        return nil
    }
}
