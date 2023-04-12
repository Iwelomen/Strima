//
//  TitlePreviewViewController.swift
//  Strima
//
//  Created by GO on 3/28/23.
//

import UIKit
import WebKit

class TitlePreviewViewController: UIViewController {
    
    private var titles: Title?
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 22, weight: .bold)
        label.text = "Harry Potter"
        return label
    }()
    
    private let overviewLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 18, weight: .bold)
        label.numberOfLines = 0
        label.text = "This is a very annoying movie that I had to watch as an adult"
        return label
    }()
    
   private let downloadButton: UIButton = {
        let button = UIButton()
       button.translatesAutoresizingMaskIntoConstraints = false
       button.setTitle("Download", for: .normal)
       button.setTitleColor(.white, for: .normal)
       button.backgroundColor = .red
       button.layer.cornerRadius = 5
       button.addTarget(self, action: #selector(downloadButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private let webView: WKWebView = {
        let webView = WKWebView()
        webView.translatesAutoresizingMaskIntoConstraints = false
        return webView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
       view.addSubview(webView)
        view.addSubview(titleLabel)
        view.addSubview(downloadButton)
        view.addSubview(overviewLabel)

        configureConstraint()
    }
    
    @objc func downloadButtonTapped() {
        print("Download button tapped")
        
    }
    
    
   private func configureConstraint() {
       NSLayoutConstraint.activate([
        
        webView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
        webView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
        webView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        webView.heightAnchor.constraint(equalToConstant: 390),
        
        
        titleLabel.topAnchor.constraint(equalTo: webView.bottomAnchor, constant: 20),
        titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
        titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
        
        overviewLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
        overviewLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
        overviewLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
        
        downloadButton.topAnchor.constraint(equalTo: overviewLabel.bottomAnchor, constant: 20),
        downloadButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        downloadButton.widthAnchor.constraint(equalToConstant: 100)
        
       
       ])
    }
    
    func configure(with model: TitlePreviewViewModel) {
        titleLabel.text = model.title
        overviewLabel.text = model.titleOverView
        
        guard let url = URL(string: "https://www.youtube.com/embed/\(model.youtubeView.id.videoId)") else { return }
        
        webView.load(URLRequest(url: url))
    }


}
