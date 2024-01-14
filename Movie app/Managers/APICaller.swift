//
//  APICaller.swift
//  Movie app
//
//  Created by Eva Sira Madarasz on 05/11/2023.
//

import Foundation

struct Constants: Codable {
    static let API_KEY = "6f21cc3e7145d88bd3466ea0fe46794a"
    static let baseURL = "https://api.themoviedb.org"
    static let YoutubeAPI_KEY = "AIzaSyBoMG4fW6EQM53IAuxIWISnbxaLMweWbAc"
    static let YoutubeBaseURL = "https://youtube.googleapis.com/youtube/v3/search?"
}

enum APIError: Error {
    case failedTogetData
}

class APICaller {
    
    static let shared = APICaller()
    
    func isStringLink(string: String) -> Bool {
        let types: NSTextCheckingResult.CheckingType = [.link]
        let detector = try? NSDataDetector(types: types.rawValue)
        guard (detector != nil && string.count > 0) else { return false }
        if detector!.numberOfMatches(in: string, options: NSRegularExpression.MatchingOptions(rawValue: 0), range: NSMakeRange(0, string.count)) > 0 {
            return true
        }
        return false
    }
    
    func getTrendingMovies(completion: @escaping (Result<[Title], Error>) -> Void) {
        
        guard let url = URL(string: "\(Constants.baseURL)/3/trending/movie/day?api_key=\(Constants.API_KEY)") else {return}
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            do {
                
                let results = try JSONDecoder().decode(TrendingTitleResponse.self, from:data)
                completion(.success(results.results))
                
            } catch {
                completion(.failure(error))
            }
        }
        
        task.resume()
    }
    
    //https://api.themoviedb.org/3/trending/tv/day?api_key=6f21cc3e7145d88bd3466ea0fe46794a
    //\(Constants.baseURL)/3/trending/tv/day?api_key=\(Constants.API_KEY)
    func getTrendingTvs(completion: @escaping (Result<[Title], Error>) -> Void) {
        guard let url = URL(string: "https://api.themoviedb.org/3/trending/tv/day?api_key=6f21cc3e7145d88bd3466ea0fe46794a") else {return}
        
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            do {
                let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                
                print(results)
            }
            catch {
                print(error)
            }
        }
        task.resume()
    }
    // \(Constants.baseURL)/3/movie/upcoming?api_key=\(Constants.API_KEY)"
    //https://api.themoviedb.org/3/movie/upcoming?api_key=6f21cc3e7145d88bd3466ea0fe46794a
    func getUpcomingMovies(completion: @escaping (Result<[Title], Error>) -> Void) {
        guard let url = URL(string: "https://api.themoviedb.org/3/movie/upcoming?api_key=\(Constants.API_KEY)") else {return}
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            do {
                let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                completion(.success(results.results))
                
                
            } catch {
                print(error)
            }
        }
        task.resume()
    }
    
    // https://api.themoviedb.org/3/movie/popular?api_key=6f21cc3e7145d88bd3466ea0fe46794a
    //\(Constants.baseURL)/3/movie/popular?api_key=\(Constants.API_KEY)
    func getPopular(completion: @escaping (Result<[Title], Error>) -> Void) {
        guard let url = URL(string: "https://api.themoviedb.org/3/movie/popular?api_key=6f21cc3e7145d88bd3466ea0fe46794a") else {return}
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            do {
                let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                completion(.success(results.results))
                
            } catch {
                
                print(error)
            }
        }
        task.resume()
    }
    
    
    //\(Constants.baseURL)/3/movie/top_rated?api_key=\(Constants.API_KEY)
    //https://api.themoviedb.org/3/movie/top_rated?api_key=6f21cc3e7145d88bd3466ea0fe46794a
    func getTopRated(completion: @escaping (Result<[Title], Error>) -> Void) {
        guard let url = URL(string: "https://api.themoviedb.org/3/movie/top_rated?api_key=6f21cc3e7145d88bd3466ea0fe46794a") else {return}
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            do {
                let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                completion(.success(results.results))
                
            } catch {
                print(error)
            }
        }
        task.resume()
    }
    //"https://api.themoviedb.org/3/discover/movie?
    
    
    
    func getDiscoverMovies(completion: @escaping (Result<[Title], Error>) -> Void)  {
        guard let url = URL(string: "https://api.themoviedb.org/3/discover/movie?api_key=6f21cc3e7145d88bd3466ea0fe46794a") else {return}
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            do {
                let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                completion(.success(results.results))
                
            } catch {
                print(error)
            }
        }
        task.resume()
    }
    
    
    func search(with query: String, completion: @escaping (Result<[Title], Error>) -> Void)  {
        guard let query = query.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) else {
            return
        }
        guard let url = URL(string: "https://api.themoviedb.org/3/search/movie?api_key=\(Constants.API_KEY)&query=\(query)") else {return}
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            do {
                let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                completion(.success(results.results))
                
            } catch {
                print(error)
            }
        }
        task.resume()
    }
    
    func getMovie(with query: String, completion: @escaping (Result<VideoElement, Error>) -> Void) {
        guard let query = query.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) else { return }
        guard let url = URL(string: "\(Constants.YoutubeBaseURL)q=\(query)&key=\(Constants.YoutubeAPI_KEY)") else {
            return
        }
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            do {
                let results = try JSONDecoder().decode(YoutubeSearchResponse.self, from: data)
                completion(.success(results.items[0]))
                
            } catch {
                completion(.failure(error))
                print(error)
            }
        }
        task.resume()
    }
}
//
