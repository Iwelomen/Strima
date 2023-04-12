//
//  Extensions.swift
//  Strima
//
//  Created by GO on 3/27/23.
//

import Foundation

extension String {
    func capitalizeFirstLetter() -> String {
        return self.prefix(1).uppercased() + self.lowercased().dropFirst()
    }
}

