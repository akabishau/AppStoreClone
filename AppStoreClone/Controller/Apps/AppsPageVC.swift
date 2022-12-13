//
//  AppsVC.swift
//  AppStoreClone
//
//  Created by Aleksey Kabishau on 12/8/22.
//

import UIKit

class AppsPageVC: BaseListVC {
	
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		collectionView.backgroundColor = .systemYellow
		collectionView.register(AppsGroupCell.self, forCellWithReuseIdentifier: AppsGroupCell.reuseId)
		
		collectionView.register(AppsPageHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: AppsPageHeader.reuseId)
		
		
		fetchData()
	}
	
	
	fileprivate func fetchData() {
		print("fetching new json data ...")
		Service.shared.fetchTopFreeApps { appGroups, error in
			if let error = error {
				print("error fetching top free apps:", error)
			} else {
				appGroups?.feed.results.forEach({ print($0.name) })
			}
		}
	}
}


// Delegate and Data Source methods
extension AppsPageVC {
	
	override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return 4
	}
	
	override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AppsGroupCell.reuseId, for: indexPath) as! AppsGroupCell
		return cell
	}
	
	override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
		let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: AppsPageHeader.reuseId, for: indexPath) as! AppsPageHeader
		return header
	}
	
	
//	 header size for
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {

		return CGSize(width: view.frame.width, height: 300)
	}
	
}


extension AppsPageVC: UICollectionViewDelegateFlowLayout {
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		
		return CGSize(width: view.frame.width, height: 250)
	}
}
