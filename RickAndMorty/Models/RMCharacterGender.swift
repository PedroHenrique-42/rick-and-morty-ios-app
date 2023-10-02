//
//  RMCharacterGender.swift
//  RickAndMorty
//
//  Created by Pedro Henrique on 02/10/23.
//

import Foundation

enum RMCharacterGender: String, Codable {
	// ('Female', 'Male', 'Genderless' or 'unknown').
	case female = "Female"
	case male = "Male"
	case genderless = "Genderless"
	case unknown = "unknown"
}
