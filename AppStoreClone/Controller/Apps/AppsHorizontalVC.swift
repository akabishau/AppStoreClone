//
//  AppsHorizontalVC.swift
//  AppStoreClone
//
//  Created by Aleksey Kabishau on 12/8/22.
//

import UIKit

class AppsHorizontalVC: BaseListVC {
	
	let reuseId = "reuseId"
	let sellLineSpacing: CGFloat = 10
	let sectionVerticalPadding: CGFloat = 12
	let sectionHorizontalPading: CGFloat = 16
	
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		collectionView.backgroundColor = .systemPink
		collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseId)
		
		if let layout = collectionViewLayout as? UICollectionViewFlowLayout {
			layout.scrollDirection = .horizontal
		}
	}
}


extension AppsHorizontalVC {
	
	override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return 10
	}
	
	
	override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseId, for: indexPath)
		
		cell.backgroundColor = .systemBlue
		return cell
	}
}


extension AppsHorizontalVC: UICollectionViewDelegateFlowLayout {
	
	
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		
		let cellHeight = (view.frame.height - 2 * sectionVerticalPadding - 2 * sellLineSpacing) / 3
		return CGSize(width: view.frame.width, height: cellHeight)
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
		return UIEdgeInsets(top: sectionVerticalPadding, left: sectionHorizontalPading, bottom: sectionVerticalPadding, right: sectionHorizontalPading)
	}
}

