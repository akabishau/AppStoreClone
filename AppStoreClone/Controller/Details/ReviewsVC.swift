//
//  ReviewsVC.swift
//  AppStoreClone
//
//  Created by Aleksey Kabishau on 12/18/22.
//

import UIKit

class ReviewsVC: BaseListVC {
	
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		collectionView.register(ReviewRowCell.self, forCellWithReuseIdentifier: ReviewRowCell.reuseId)
		collectionView.contentInset = .init(top: 0, left: 16, bottom: 0, right: 16)
		
		if let layout = collectionViewLayout as? UICollectionViewFlowLayout {
			layout.scrollDirection = .horizontal
		}
	}
	
	
	override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return 6
	}
	
	
	override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ReviewRowCell.reuseId, for: indexPath) as! ReviewRowCell
		return cell
	}
}


extension ReviewsVC: UICollectionViewDelegateFlowLayout {
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		
		return .init(width: view.frame.width - 48, height: view.frame.height)
	}
}
