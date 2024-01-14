//
//  Movie.swift
//  Movie app
//
//  Created by Eva Madarasz on 09/11/2023.



import Foundation


struct TrendingTitleResponse: Codable {
    let page: Int
    let results: [Title]
   

    enum CodingKeys: String, CodingKey {
        case page, results
    }
}

 struct Title: Codable {
    let adult: Bool
    let backdropPath: String?
    let genreIDS: [Int]
    let id: Int
    let originalLanguage: String
    let originalTitle: String?
    let overview: String
    let popularity: Double
    let posterPath: String?
    let releaseDate: String?
    let title: String?
    let video: Bool?
    let voteAverage: Double?
    let voteCount: Int?

    enum CodingKeys: String, CodingKey {
        case adult
        case backdropPath = "backdrop_path"
        case genreIDS = "genre_ids"
        case id
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case overview
        case popularity
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case title
        case video
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }
}







//// MARK: - Welcome
//struct TrendingTitleResponse: Codable {
//    let page: Int
//    let results: [Title]
//}
//
//// MARK: - Movie
//
//struct Title: Codable {
//
//
//    let adult: Bool
//    let backdropPath: String
//    let id: Int
//    let title: String
//    let  originalLanguage, originalTitle, overview: String
//    let posterPath, mediaType: String
//    let genreIDS: [Int]
//    let popularity: Double
//    let releaseDate: String
//    let video: Bool
//    let voteAverage: Double
//    let voteCount: Int
//
//    enum CodingKeys: String, CodingKey {
//        case adult
//        case backdropPath = "backdrop_path"
//        case id
//        case title = "title"
//        case originalLanguage = "original_language"
//        case originalTitle = "original_title"
//        case overview
//        case posterPath = "poster_path"
//        case mediaType = "media_type"
//        case genreIDS = "genre_ids"
//        case popularity
//        case releaseDate = "release_date"
//        case video
//        case voteAverage = "vote_average"
//        case voteCount = "vote_count"
//        case results
//    }
//
//   }

//
//init(from decoder: Decoder) throws {
//       let container = try decoder.container(keyedBy: CodingKeys.self)
//       self.title = try container.decode(String.self, forKey: .title)
//   }

/*
 {"adult":false,"backdrop_path":"/ww1eIoywghjoMzRLRIcbJLuKnJH.jpg","belongs_to_collection":{"id":403374,"name":"Jack Reacher Collection","poster_path":"/qtafXiYDUMKxzsssU41qWey5oiT.jpg","backdrop_path":"/vViRXFnSyGJ2fzMbcc5sqTKswcd.jpg"},"budget":60000000,"genres":[{"id":28,"name":"Action"},{"id":53,"name":"Thriller"}],"homepage":"","id":343611,"imdb_id":"tt3393786","original_language":"en","original_title":"Jack Reacher: Never Go Back","overview":"When Major Susan Turner is arrested for treason, ex-investigator Jack Reacher undertakes the challenging task to prove her innocence and ends up exposing a shocking conspiracy.","popularity":64.597,"poster_path":"/cOg3UT2NYWHZxp41vpxAnVCOC4M.jpg","production_companies":
 
 {"id":4,"logo_path":"/gz66EfNoYPqHTYI4q9UEN4CbHRc.png","name":"Paramount","origin_country":"US"}],"production_countries":[{"iso_3166_1":"CN","name":"China"},{"iso_3166_1":"US","name":"United States of America"}],"release_date":"2016-10-19","revenue":162146076,"runtime":118,"spoken_languages":[{"english_name":"English","iso_639_1":"en","name":"English"}],"status":"Released","tagline":"Justice is Coming.","title":"Jack Reacher: Never Go Back","video":false,"vote_average":5.954,"vote_count":4527}
 */

//struct TrendingMoviesResponse : Codable {
//    let results: [Movie]
//}

//struct Movie: Codable {
//    let id: String
//    let media_type: String?
//    let original_name: String?
//    let original_title: String?
//    let poster_path: String?
//    let overview: String?
//    let vote_count: Int
//    let release_date: String?
//    let vote_avarage: Double
//
//
//}
//
//It looks like there might be an issue with the database configuration in your app. The error code -10817 often relates to a problem with the simulator environment while configuring the database. This could potentially impact the functionality of the app, especially when dealing with data retrieval or storage.
//
//If you're developing the app, I'd suggest checking the database setup, ensuring compatibility with the simulator environment, and reviewing any recent changes made to the database configuration or schema. Additionally, verifying the code where the database is being initialized or configured might provide clues about the error.
