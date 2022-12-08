//
//  AppSearchVC.swift
//  AppStoreClone
//
//  Created by Aleksey Kabishau on 12/3/22.
//

import UIKit
import SDWebImage

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
		Service.shared.fetchApps { results, error in
			if let error = error {
				print("failed to fetch apps:", error)
				return
			}
			
			self.appResults = results
			DispatchQueue.main.async {
				self.collectionView.reloadData()
			}
		}
	}
	
	
	override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SearchResultCell.reuseId, for: indexPath) as! SearchResultCell
		cell.appInfo = appResults[indexPath.item]
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
