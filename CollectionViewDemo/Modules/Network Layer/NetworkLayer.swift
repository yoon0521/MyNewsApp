//
//  NetworkLayer.swift
//  CollectionViewDemo
//
//  Created by Yoonha Kim on 4/7/21.
//
import Foundation

class NetworkManager {
    
    static let manager = NetworkManager()
    
//    import Foundation

//    let headers = [
//        "x-rapidapi-key": "4df68724fbmsh22b2321938e84b5p1133d5jsncf57dff8b626",
//        "x-rapidapi-host": "contextualwebsearch-websearch-v1.p.rapidapi.com"
//    ]
//
//    let request = NSMutableURLRequest(url: NSURL(string: "https://contextualwebsearch-websearch-v1.p.rapidapi.com/api/search/NewsSearchAPI?q=taylor%20swift&pageNumber=1&pageSize=10&autoCorrect=true&fromPublishedDate=null&toPublishedDate=null")! as URL,
//                                            cachePolicy: .useProtocolCachePolicy,
//                                        timeoutInterval: 10.0)
//    request.httpMethod = "GET"
//    request.allHTTPHeaderFields = headers
//
//    let session = URLSession.shared
//    let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
//        if (error != nil) {
//            print(error)
//        } else {
//            let httpResponse = response as? HTTPURLResponse
//            print(httpResponse)
//        }
//    })

//    dataTask.resume()
    
    private init() {}
    
    func fetch<T>(url: String, completion: @escaping (Result<T, AppError>) -> Void) where T: Decodable {
        
        guard let finalUrl = URL(string: url) else {
            completion(.failure(.badUrl))
            return
        }
        
        let dataTask = URLSession.shared.dataTask(with: finalUrl) { data, response, error in
            let completionOnMain: (Result<T, AppError>) -> Void = { result in
                DispatchQueue.main.async {
                    completion(result)
                }
            }
            //Error check
            guard error == nil else  {
                completionOnMain(.failure(.serverError))
                return
            }
            
            guard let response = response as? HTTPURLResponse else {
                completionOnMain(.failure(.badResponse))
                return
            }
            
            switch response.statusCode {
            case 200...299:
                guard let unwrappedData = data else {
                    completionOnMain(.failure(.noData))
                    return
                }
                do {
                    let object = try JSONDecoder().decode(T.self, from: unwrappedData)
                    completionOnMain(.success(object))
                }
                catch {
                    completionOnMain(.failure(.parsingFail))
                }
                
            default:
                completionOnMain(.failure(.badUrl))
            }
        }
        dataTask.resume()
    }
}
