//
//  YoutubeSearchResponse.swift
//  Movie app
//
//  Created by Eva Sira Madarasz on 29/11/2023.
//

import Foundation

/*
items =     (
            {
        etag = ANPRpSiPIwGk158kAatCGGyhDuo;
        id =             {
            kind = "youtube#video";
            videoId = 15U5zAPHoto;
        };
        kind = "youtube#searchResult";
    },
            {
        etag = "iu1i9TZRIHZiH4nmr8zyS-gJjKg";
        id =             {
            kind = "youtube#video";
            videoId = Fk5EjcSjCOk;
        };
        kind = "youtube#searchResult";
    },
*/
 
 
struct YoutubeSearchResponse: Codable {
    let items: [VideoElement]
}

struct VideoElement: Codable {
    let id: IdVideoElement
}

struct IdVideoElement: Codable {
    let kind: String
    let videoId: String
}
