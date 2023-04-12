//
//  ApiCaller.swift
//  Strima
//
//  Created by GO on 3/27/23.
//

import Foundation


struct Constants {
    static let apiKey = "1be4680b8f0db8115b93a72b2f3d63a8"
    static let baseUrl = "https://api.themoviedb.org"
    static let youTubeApiKey = "AIzaSyA54Rz2ajWK2rmZpaliZaE_kzYSQBarZnI"
    static let youTubeBaseUrl = "https://youtube.googleapis.com/youtube/v3/search?"
}

enum ApiError: Error {
    case failedToGetData
}


class ApiCaller {
    static let shared = ApiCaller()
    
    func getTrendingMovies(completion: @escaping (Result<[Title], Error>) -> Void) {
        guard let url = URL(string: "\(Constants.baseUrl)/3/trending/movie/day?api_key=\(Constants.apiKey)") else {return}
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) {data,_,error in
            guard let data = data, error == nil else {return}
            
            do {
                
                // MARK: - use without a model to test endpoint
                //                let reesult = try JSONSerialization.jsonObject(with: data, options: .fragmentsAllowed)
                
                let result = try JSONDecoder().decode(TendingTitlesResponse.self, from: data)
                completion(.success(result.results))
            } catch {
                completion(.failure(ApiError.failedToGetData))
            }
            
            
        }
        task.resume()
    }
    
    func getTrendingTvs(completion: @escaping (Result<[Title], Error>) -> Void) {
        guard let url = URL(string: "\(Constants.baseUrl)/3/trending/tv/day?api_key=\(Constants.apiKey)") else {return}
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) {data,_,error in
            guard let data = data, error == nil else {return}
            
            do {
                let result = try JSONDecoder().decode(TendingTitlesResponse.self, from: data)
                completion(.success(result.results))
                
            } catch {
                completion(.failure(ApiError.failedToGetData))
            }
            
            
        }
        task.resume()
    }
    
    func getUpcomingMovies(completion: @escaping (Result<[Title], Error>) -> Void) {
        guard let url = URL(string: "\(Constants.baseUrl)/3/movie/upcoming?api_key=\(Constants.apiKey)&language=en-US&page=1") else {return}
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) {data,_,error in
            guard let data = data, error == nil else {return}
            
            do {
                let result = try JSONDecoder().decode(TendingTitlesResponse.self, from: data)
                completion(.success(result.results))
                
            } catch {
                completion(.failure(ApiError.failedToGetData))
                
            }
            
            
        }
        task.resume()
    }
    
    func getPopularMovies(completion: @escaping (Result<[Title], Error>) -> Void) {
        guard let url = URL(string: "\(Constants.baseUrl)/3/movie/popular?api_key=\(Constants.apiKey)&language=en-US&page=1") else {return}
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) {data,_,error in
            guard let data = data, error == nil else {return}
            
            do {
                let result = try JSONDecoder().decode(TendingTitlesResponse.self, from: data)
                completion(.success(result.results))
                
            } catch {
                completion(.failure(ApiError.failedToGetData))
                
            }
            
            
        }
        task.resume()
    }
    
    func getTopRatedMovies(completion: @escaping (Result<[Title], Error>) -> Void) {
        guard let url = URL(string: "\(Constants.baseUrl)/3/movie/popular?api_key=\(Constants.apiKey)&language=en-US&page=1") else {return}
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) {data,_,error in
            guard let data = data, error == nil else {return}
            
            do {
                let result = try JSONDecoder().decode(TendingTitlesResponse.self, from: data)
                completion(.success(result.results))
                
            } catch {
                completion(.failure(ApiError.failedToGetData))
                
            }
            
            
        }
        task.resume()
    }
    
    func getDiscoverMovies(completion: @escaping (Result<[Title], Error>) -> Void) {
        guard let url = URL(string: "\(Constants.baseUrl)/3/discover/movie?api_key=\(Constants.apiKey)&language=en-US&sort_by=popularity.desc&include_adult=false&include_video=false&page=1&with_watch_monetization_types=flatrate") else {return}
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) {data,_,error in
            guard let data = data, error == nil else {return}
            
            do {
                let result = try JSONDecoder().decode(TendingTitlesResponse.self, from: data)
                completion(.success(result.results))
                
            } catch {
                completion(.failure(ApiError.failedToGetData))
                
            }
            
            
        }
        task.resume()
    }
    
    func search(with quary: String, completion: @escaping (Result<[Title], Error>) -> Void) {
        
        guard let quary = quary.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) else { return }
        guard let url = URL(string: "\(Constants.baseUrl)/3/search/movie?api_key=\(Constants.apiKey)&query=\(quary)") else {
            return
            
        }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) {data,_,error in
            guard let data = data, error == nil else {return}
            
            do {
                let result = try JSONDecoder().decode(TendingTitlesResponse.self, from: data)
                completion(.success(result.results))
                
            } catch {
                completion(.failure(ApiError.failedToGetData))
                
            }
            
            
        }
        task.resume()
    }
    
    func getMovie(with quary: String, completion: @escaping (Result<VideosElement, Error>) -> Void) {
        
        guard let quary = quary.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) else {return}
        
        guard let url = URL(string: "\(Constants.youTubeBaseUrl)q=\(quary)&key=\(Constants.youTubeApiKey)") else {return}
        
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) {data,_,error in
            guard let data = data, error == nil else {return}
            
            do {
                let result = try JSONDecoder().decode(YoutubeSearchResponse.self, from: data)
                completion(.success(result.items[0]))
                print(result)
                
            } catch {
                completion(.failure(ApiError.failedToGetData))
                print(error.localizedDescription)
            }
        }
        task.resume()
    }
    
}
