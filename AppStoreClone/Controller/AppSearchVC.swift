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
		return CGSize(width: view.frame.width, height: 250)
	}
}
