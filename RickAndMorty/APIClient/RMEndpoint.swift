//
//  RMEndpoint.swift
//  RickAndMorty
//
//  Created by Pedro Henrique on 02/10/23.
//

import Foundation

/// Represents unic apí endpoints
@frozen enum RMEndpoint: String {
	/// Endpoint to get character info
	case character
	/// Endpoint to get location info
	case location
	/// Endpoint to get episode info
	case episode
}
