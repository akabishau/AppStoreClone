//
//  AppDetailsVC.swift
//  AppStoreClone
//
//  Created by Aleksey Kabishau on 12/14/22.
//

import UIKit

class AppDetailsVC: BaseListVC {
	
	var appId: String? {
		didSet {
			print("my id", appId!)
			
			let urlString = "https://itunes.apple.com/lookup?id=\(appId!)"
			print(urlString)
			Service.shared.fetchGenericJSONData(urlString: urlString) { (result: SearchResult?, error) in
				if let error = error {
					print("error fetching app details", error)
					return
				}
				
				if let app = result?.results.first {
					print(app.releaseNotes)
				}
			}
		}
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
//		navigationItem.largeTitleDisplayMode = .never
		
		collectionView.backgroundColor = .systemBackground
		collectionView.register(AppDetailCell.self, forCellWithReuseIdentifier: AppDetailCell.reuseId)
	}
}


extension AppDetailsVC {
	
	override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return 1
	}
	
	override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AppDetailCell.reuseId, for: indexPath) as! AppDetailCell
		
		return cell
	}
}


extension AppDetailsVC: UICollectionViewDelegateFlowLayout {
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		return .init(width: view.frame.width, height: 300)
	}
}
