//
//  Service.swift
//  AppStoreClone
//
//  Created by Aleksey Kabishau on 12/7/22.
//

import Foundation


class Service {
	
	static let shared = Service()
	
	
	func fetchApps(searchTerm: String, completion: @escaping ([Result], Error?) -> ()) {
		print(#function)
		let stringUrl = "https://itunes.apple.com/search?term=\(searchTerm)&entity=software"
		guard let url = URL(string: stringUrl) else { return }
		
		URLSession.shared.dataTask(with: url) { data, response, error in
			// error case
			if let error = error  {
				print("failed to fetch app serch", error)
				completion([], error)
				return
			}
			
			// success
			guard let data = data else { return }
			
			do {
				let searchResult = try JSONDecoder().decode(SearchResult.self, from: data)
				completion(searchResult.results, nil)
			} catch {
				print("failed to decode:", error)
				completion([], error)
			}
		}.resume()
	}
}
