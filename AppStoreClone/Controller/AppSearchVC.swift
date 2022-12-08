//
//  AppSearchVC.swift
//  AppStoreClone
//
//  Created by Aleksey Kabishau on 12/3/22.
//

import UIKit

class AppSearchVC: UICollectionViewController {
	
	
	fileprivate var appResults = [Result]()
	
	
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
				self.appResults = searchResult.results
				DispatchQueue.main.async {
					self.collectionView.reloadData()
				}
				
			} catch {
				print("failed to decode", error)
			}
			
		}.resume()
	}
	
	
	override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		
		let appInfo = appResults[indexPath.item]
		
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SearchResultCell.reuseId, for: indexPath) as! SearchResultCell
		cell.nameLabel.text = appInfo.trackName
		cell.categoryLabel.text = appInfo.primaryGenreName
		cell.ratingsLabel.text = "Rating: \(appInfo.averageUserRating ?? 0)"
		return cell
	}
	
	
	override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return appResults.count
	}
	
}


extension AppSearchVC: UICollectionViewDelegateFlowLayout {
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		return CGSize(width: view.frame.width, height: 350)
	}
}
