//
//  AppSearchVC.swift
//  AppStoreClone
//
//  Created by Aleksey Kabishau on 12/3/22.
//

import UIKit

class AppSearchVC: UICollectionViewController {
	
	
	init() {
		super.init(collectionViewLayout: UICollectionViewFlowLayout())
	}
	
	required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
	
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		
		collectionView.backgroundColor = .systemBackground
		collectionView.register(SearchResultCell.self, forCellWithReuseIdentifier: SearchResultCell.reuseId)
		
		fetchITunesApps()
	}
	
	
	fileprivate func fetchITunesApps() {
		let stringUrl = "https://itunes.apple.com/search?term=instagram&entity=software"
		guard let url = URL(string: stringUrl) else { return }
		
		URLSession.shared.dataTask(with: url) { data, response, error in
			// error case
			if let error = error  {
				print("failed to fetch app serch", error)
				return
			}
			
			// success
			guard let data = data else { return }
			
			do {
				let searchResult = try JSONDecoder().decode(SearchResult.self, from: data)
				searchResult.results.forEach { print($0.trackName) }
			} catch {
				print("failed to decode", error)
			}
			
		}.resume()
	}
	
	
	override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SearchResultCell.reuseId, for: indexPath)
		return cell
	}
	
	
	override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return 5
	}
	
}


extension AppSearchVC: UICollectionViewDelegateFlowLayout {
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		return CGSize(width: view.frame.width, height: 350)
	}
}
