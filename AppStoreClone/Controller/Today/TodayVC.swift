//
//  TodayVC.swift
//  AppStoreClone
//
//  Created by Aleksey Kabishau on 12/25/22.
//

import UIKit

class TodayVC: BaseListVC {
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		navigationController?.isNavigationBarHidden = true
		
		collectionView.backgroundColor = .lightGray
		collectionView.register(TodayCell.self, forCellWithReuseIdentifier: TodayCell.reuseId)
		collectionView.contentInset = .init(top: 0, left: 16, bottom: 0, right: 16)
		
	}
	
	
	override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return 5
	}
	
	
	override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TodayCell.reuseId, for: indexPath) as! TodayCell
		
		return cell
	}
	
	
	override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
		print("animate cell to the full screen")
		
		// 1 get cell
		guard let cell = collectionView.cellForItem(at: indexPath) else { return }
		
		// 2 create a view with tp gesture
		let redView = UIView()
		redView.backgroundColor = .systemRed
		redView.layer.cornerRadius = 16
		redView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleRemoveRedView(gesture:))))
		
		// 3 get the absolute coordinates and assign them to view
		guard let startingFrame = cell.superview?.convert(cell.frame, to: nil) else { return }
		self.startingFrame = startingFrame
		redView.frame = startingFrame
		view.addSubview(redView)
		
		// 4 animate to the final position
		UIView.animate(withDuration: 0.7, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.7, options: .curveEaseOut) {
			redView.frame = self.view.frame
		}
		
	}
	
	var startingFrame: CGRect?
	
	
	@objc private func handleRemoveRedView(gesture: UITapGestureRecognizer) {
		
		UIView.animate(withDuration: 0.7, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.7, options: .curveEaseOut) {
			gesture.view?.frame = self.startingFrame ?? .zero
		} completion: { _ in
			gesture.view?.removeFromSuperview()
		}
	}
}


extension TodayVC: UICollectionViewDelegateFlowLayout {
	
	// width calculation pushes cells 32 points from the left and right
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		return .init(width: collectionView.frame.width - 64, height: 450)
	}
	
	// set the space between items - default is 10
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
		return 32
	}
	
	// set top and bottom paddings for the items in the section
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
		return .init(top: 32, left: 0, bottom: 32, right: 0)
	}
}
