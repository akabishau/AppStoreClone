//
//  ReviewRowCell.swift
//  AppStoreClone
//
//  Created by Aleksey Kabishau on 12/19/22.
//

import UIKit

class ReviewCell: UICollectionViewCell {

	static let reuseId = String(describing: ReviewCell.self)


	let titleLabel = UILabel(text: "Review Title", font: .boldSystemFont(ofSize: 18))
	let authorLabel = UILabel(text: "Author", font: .systemFont(ofSize: 16))
	let starsLabel = UILabel(text: "Stars", font: .systemFont(ofSize: 14))
	let bodyLabel = UILabel(text: "Review body\nReview body\nReview body", font: .systemFont(ofSize: 14), numberOfLines: 0)



	override init(frame: CGRect) {
		super.init(frame: frame)

		backgroundColor = .secondarySystemFill
		layer.cornerRadius = 16
//		clipsToBounds = true
		
		setUpViews()
	}

	required init?(coder: NSCoder) { fatalError() }

	
	private func setUpViews() {
		
		let horizontalStackView = UIStackView(arrangedSubviews: [titleLabel, authorLabel])
		horizontalStackView.spacing = 12
		
		let stackView = UIStackView(arrangedSubviews: [
			horizontalStackView,
			starsLabel,
			bodyLabel
		])
		stackView.axis = .vertical
		stackView.spacing = 12
		
		titleLabel.setContentCompressionResistancePriority(.init(0), for: .horizontal)
		authorLabel.textAlignment = .right
		
		
		addSubview(stackView)
		stackView.fillSuperview(padding: .init(top: 20, left: 20, bottom: 20, right: 20))
	}
}
