//
//  AppsVC.swift
//  AppStoreClone
//
//  Created by Aleksey Kabishau on 12/8/22.
//

import UIKit

class AppsPageVC: BaseListVC {
	
	
	var appGroups = [AppGroup]()
	
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		collectionView.backgroundColor = .systemYellow
		collectionView.register(AppsGroupCell.self, forCellWithReuseIdentifier: AppsGroupCell.reuseId)
		
		collectionView.register(AppsPageHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: AppsPageHeader.reuseId)
		
		
		fetchData()
	}
	
	
	fileprivate func fetchData() {
		
		var topFreeApps: AppGroup?
		var topPaidApps: AppGroup?
		
		let dispatchGroup = DispatchGroup()
		
		dispatchGroup.enter()
		Service.shared.fetchTopFreeApps { appGroup, error in
			
			dispatchGroup.leave()
			if let error = error {
				print("error fetching top free apps:", error)
			} else {
				
				if let appGroup = appGroup {
					topFreeApps = appGroup
				}
			}
		}

		
		dispatchGroup.enter()
		Service.shared.fetchTopPaidApps { appGroup, error in
			
			dispatchGroup.leave()
			if let error = error {
				print("error fetching top paid apps:", error)
			} else {
				if let appGroup = appGroup {
					topPaidApps = appGroup
				}
			}
		}
		
		
		dispatchGroup.notify(queue: .main) {
			//TODO: Posibly refactor to adding groups to array directly after network call
			if let group = topFreeApps {
				self.appGroups.append(group)
			}
			
			if let group = topPaidApps {
				self.appGroups.append(group)
			}
			
			self.collectionView.reloadData()
		}
	}
}


// Delegate and Data Source methods
extension AppsPageVC {
	
	override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return appGroups.count
	}
	
	override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AppsGroupCell.reuseId, for: indexPath) as! AppsGroupCell
		let appGroup = appGroups[indexPath.item]
		cell.titleLabel.text = appGroup.feed.title
		cell.horizontalController.appGroup = appGroup
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
