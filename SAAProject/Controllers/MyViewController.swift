//
//  MyViewController.swift
//  SAAProject
//
//  Created by SAHIL AMRUT AGASHE on 21/10/24.
//

import UIKit

class MyViewController: UIViewController {
    
    let bgColors: [UIColor] = [.red, .blue, .green, .cyan, .yellow]
    private lazy var myTableView = {
        let tv = UITableView()
        tv.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.dataSource = self
        tv.delegate = self
        return tv
    }()
    
    private lazy var myCollectionView = {
        let cv = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        cv.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "CVCell")
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.dataSource = self
        cv.delegate = self
        return cv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(myCollectionView)
        NSLayoutConstraint.activate([
            myCollectionView.topAnchor.constraint(equalTo: view.topAnchor),
            myCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            myCollectionView.leftAnchor.constraint(equalTo: view.leftAnchor),
            myCollectionView.rightAnchor.constraint(equalTo: view.rightAnchor)
        ])
    }
}

extension MyViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        5
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        var config = cell.defaultContentConfiguration()
        config.text = "Hi \(indexPath.section)"
        config.secondaryText = "Sahil"
        cell.contentConfiguration = config
        
        return cell
    }
    
    
}

extension MyViewController: UITableViewDelegate {
    
}

extension MyViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        bgColors.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CVCell", for: indexPath)
        cell.backgroundColor = bgColors[indexPath.section]
        return cell
    }
    
    
}

extension MyViewController: UICollectionViewDelegate {
    
}
