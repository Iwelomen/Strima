//
//  TitleTableViewCell.swift
//  Strima
//
//  Created by GO on 3/28/23.
//

import UIKit

class TitleTableViewCell: UITableViewCell {
    
    static let identifier = "TitleTableViewCell"
    
    private let titlePostalImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 5
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let playTitleButton: UIButton = {
        let buttton = UIButton()
        let image = UIImage(systemName: "play.circle", withConfiguration: UIImage.SymbolConfiguration(pointSize: 30))
        buttton.setImage(image, for: .normal)
        buttton.tintColor = .black
        buttton.translatesAutoresizingMaskIntoConstraints = false
        return buttton
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(titleLabel)
        contentView.addSubview(playTitleButton)
        contentView.addSubview(titlePostalImageView)
        
        setUpConstraint()
        
    }
    
    private func setUpConstraint() {
        NSLayoutConstraint.activate([
            
            // MARK: - Title postal Image
            titlePostalImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            titlePostalImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            titlePostalImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            titlePostalImageView.widthAnchor.constraint(equalToConstant: 100),
            titlePostalImageView.heightAnchor.constraint(equalToConstant: 130),
            
            // MARK: - Title label
            
            titleLabel.leadingAnchor.constraint(equalTo: titlePostalImageView.trailingAnchor, constant: 20),
            titleLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            
            // MARK: - Play button
            
            playTitleButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15),
            playTitleButton.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
            
            
            
            
        ])
    }
    
    public func configure(with model: TitleViewModel) {
        guard let url = URL(string: "https://image.tmdb.org/t/p/w500/\(model.posterURL)") else {return}
        
        titlePostalImageView.sd_setImage(with: url, completed: nil)
        titleLabel.text = model.titleName
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
