//
//  RMRequest.swift
//  RickAndMorty
//
//  Created by Pedro Henrique on 02/10/23.
//

import Foundation

/// Object that represents a single API call
final class RMRequest {
	/// API constants
	private struct Constants {
		static let baseUrl = "https://rickandmortyapi.com/api"
	}
	
	/// Desired endpoint
	private let endpoint: RMEndpoint
	
	/// Path components for API, if specified
	private let pathComponents: Set<String>
	
	/// Query parameters for API, if specified
	private let queryParameters: [URLQueryItem]
	
	/// Constructed url for the api request in string format
	private var urlString: String {
		var string = Constants.baseUrl
		string += "/"
		string += endpoint.rawValue
		
		if !pathComponents.isEmpty {
			pathComponents.forEach { component in
				string += "/\(component)"
			}
		}
		
		if !queryParameters.isEmpty {
			string += "?"
			let argumentString = queryParameters.compactMap { item in
				guard let value = item.value else { return nil }
				return "\(item.name)=\(value)"
			}.joined(separator: "&")
			
			string += argumentString
		}
		
		return string
	}
	
	/// Computed & constructed API url
	public var url: URL? {
		return URL(string: urlString)
	}
	
	/// Desired http method
	public let httpMethod = "GET"
	
	// MARK: - Public
	
	/// Construct request
	/// - Parameters:
	///   - endpoint: Target endpoint
	///   - pathComponents: Collection of path components
	///   - queryParameters: Collection of query parameters
	public init(
		endpoint: RMEndpoint,
		pathComponents: Set<String> = [],
		queryParameters: [URLQueryItem] = []
	) {
		self.endpoint = endpoint
		self.pathComponents = pathComponents
		self.queryParameters = queryParameters
	}
}
