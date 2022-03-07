//
//  NetworkManager.swift
//  Github
//
//  Created by Karthick R on 4/11/21.
//

import Foundation
//MARK: Network Error
enum NetworkError: Error, Equatable {
    case apiURLError
    case statusCodeError
    case dataError
    case decodeError
    case responseError
}

class NetworkManager {
    //MARK: URLSession Object
    private var objUrlSession: URLSession?
    //MARK: URLSession Configuration
    private var objSessionConfiguration: URLSessionConfiguration {
        let tempSessionConfig = URLSessionConfiguration.default
        tempSessionConfig.timeoutIntervalForRequest = 30.0
        tempSessionConfig.timeoutIntervalForResource = 30.0
        return tempSessionConfig
    }
    
    init() { }
    
    // Call Network Api
    func callNetworkApi<T:Codable>(strApi: String, dataHandler: @escaping (Result<T, NetworkError>) -> ()) {
        objUrlSession = URLSession(configuration: objSessionConfiguration)
        guard let tempURL =  URL(string: strApi) else {
            return dataHandler(.failure(.apiURLError))
        }
        var objRequest = URLRequest(url: tempURL)
        objRequest.httpMethod = "GET"
        objUrlSession?.dataTask(with: objRequest, completionHandler: {(data, response, error) in
            if error != nil {
                return dataHandler(.failure(.responseError))
            }
            else {
                guard let tempURLResponse = response as? HTTPURLResponse,
                      tempURLResponse.statusCode == 200 else {
                    return dataHandler(.failure(.statusCodeError))
                }
                guard let tempData = data else {
                    return dataHandler(.failure(.dataError))
                }
                do {
                    let model = try JSONDecoder().decode(T.self, from: tempData)
                    dataHandler(.success(model))
                }catch(let error) {
                    print(error)
                    dataHandler(.failure(.decodeError))
                }
            }
        })
        .resume()
    }
}

