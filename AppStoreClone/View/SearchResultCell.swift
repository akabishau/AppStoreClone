//
//  SearchResultCell.swift
//  AppStoreClone
//
//  Created by Aleksey Kabishau on 12/5/22.
//

import UIKit

class SearchResultCell: UICollectionViewCell {
	
	static let reuseId = String(describing: SearchResultCell.self)
	
	
	let appIconImageView: UIImageView = {
		let imageView = UIImageView()
		imageView.backgroundColor = .red
		imageView.widthAnchor.constraint(equalToConstant: 64).isActive = true
		imageView.heightAnchor.constraint(equalToConstant: 64).isActive = true
		imageView.layer.cornerRadius = 12
		return imageView
	}()
	
	let nameLabel: UILabel = {
		let label = UILabel()
		label.text = "APP NAME"
		return label
	}()
	
	let categoryLabel: UILabel = {
		let label = UILabel()
		label.text = "Photos & Videos"
		return label
	}()
	
	let ratingsLabel: UILabel = {
		let label = UILabel()
		label.text = "9.26M"
		return label
	}()
	
	let getButton: UIButton = {
		let button = UIButton(type: .system)
		button.setTitle("GET", for: .normal)
		button.setTitleColor(.blue, for: .normal)
		button.titleLabel?.font = .boldSystemFont(ofSize: 14)
		button.backgroundColor = UIColor(white: 0.95, alpha: 1)
		button.widthAnchor.constraint(equalToConstant: 80).isActive = true
		button.heightAnchor.constraint(equalToConstant: 32).isActive = true
		button.layer.cornerRadius = 12
		return button
	}()
	
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		
		backgroundColor = .yellow
		
		let labelsStackView = UIStackView(arrangedSubviews: [nameLabel, categoryLabel, ratingsLabel])
		labelsStackView.axis = .vertical
		
		let stackView = UIStackView(arrangedSubviews: [appIconImageView, labelsStackView, getButton])
		stackView.spacing = 12
		//TODO: - learn more about alignment property of the stack view
		stackView.alignment = .center
		stackView.translatesAutoresizingMaskIntoConstraints = false
		addSubview(stackView)
		stackView.fillSuperview(padding: UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16))
	}
	
	
	required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
}
