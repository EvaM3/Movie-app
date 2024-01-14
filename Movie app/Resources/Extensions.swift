//
//  Extensions.swift
//  Movie app
//
//  Created by Eva Sira Madarasz on 15/11/2023.
//

import Foundation


extension String {
    func capitalizeFirstLetter() -> String {
        return self.prefix(1).uppercased() + self.lowercased().dropFirst()
    }
}
