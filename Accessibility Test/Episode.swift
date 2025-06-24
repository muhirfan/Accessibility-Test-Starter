//
//  Episode.swift
//  Accessibility Test
//
//  Created by Muhammad Irfan on 25/06/25.
//

import Foundation

// MARK: - Model
struct Episode: Identifiable {
    let id = UUID()
    let title: String
    let duration: String
}
