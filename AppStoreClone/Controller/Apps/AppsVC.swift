//
//  AppsVC.swift
//  AppStoreClone
//
//  Created by Aleksey Kabishau on 12/8/22.
//

import UIKit

class AppsVC: BaseListVC {
	
	let reuseCellId = "reuseCellId"
	
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		collectionView.backgroundColor = .systemYellow
		collectionView.register(AppsGroupCell.self, forCellWithReuseIdentifier: AppsGroupCell.reuseId)
		
	}
}


extension AppsVC {
	
	override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return 5
	}
	
	override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AppsGroupCell.reuseId, for: indexPath) as! AppsGroupCell
		return cell
	}
}


extension AppsVC: UICollectionViewDelegateFlowLayout {
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		
		return CGSize(width: view.frame.width, height: 250)
	}
}
