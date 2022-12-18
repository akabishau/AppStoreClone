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
			let urlString = "https://itunes.apple.com/lookup?id=\(appId!)"
			Service.shared.fetchGenericJSONData(urlString: urlString) { (result: SearchResult?, error) in
				if let error = error {
					print("error fetching app details", error)
					return
				}
				
				if let appDetails = result?.results.first {
					self.appDetails = appDetails
				}
				DispatchQueue.main.async {
					self.collectionView.reloadData()
				}
			}
		}
	}
	
	
	var appDetails: Result?
	
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
//		navigationItem.largeTitleDisplayMode = .never
		
		collectionView.backgroundColor = .systemBackground
		collectionView.register(AppDetailCell.self, forCellWithReuseIdentifier: AppDetailCell.reuseId)
		collectionView.register(Previewcell.self, forCellWithReuseIdentifier: Previewcell.reuseId)
	}
}


extension AppDetailsVC {
	
	override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return 2
	}
	
	
	override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		if indexPath.item  == 0 {
			let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AppDetailCell.reuseId, for: indexPath) as! AppDetailCell
			cell.appDetails = appDetails
			return cell
		} else if indexPath.item == 1 {
			let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Previewcell.reuseId, for: indexPath) as! Previewcell
			cell.previewVC.appDetails = appDetails
			return cell
		} else {
			return UICollectionViewCell()
		}
	}
}


extension AppDetailsVC: UICollectionViewDelegateFlowLayout {
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		
		if indexPath.item == 0 {
			var cellHeight: CGFloat
			// cell auto-size calculation
			let dummyCell = AppDetailCell(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 1000)) // 1000 is arbitrary number
			dummyCell.appDetails = appDetails
			dummyCell.layoutIfNeeded()
			
			let estimatedSize = dummyCell.systemLayoutSizeFitting(.init(width: view.frame.width, height: 1000))
			//		print("Auto-sizing: \(estimatedSize)")
			cellHeight = estimatedSize.height
			
			return .init(width: view.frame.width, height: cellHeight)
		} else if indexPath.item == 1 {
			return .init(width: view.frame.width, height: 400)
		} else {
			return .init(width: view.frame.width, height: 100)
		}
	}
}
