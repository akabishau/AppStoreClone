//
//  ReviewResult.swift
//  AppStoreClone
//
//  Created by Aleksey Kabishau on 12/21/22.
//

import Foundation


struct ReviewResult: Decodable {
	let feed: ReviewFeed
}


struct ReviewFeed: Decodable {
	let entry: [Entry]
}


struct Entry: Decodable {
	let author: Author
	let title: Label
	let content: Label
}

struct Author: Decodable {
	let name: Label
}


struct Label: Decodable {
	let label: String
}
