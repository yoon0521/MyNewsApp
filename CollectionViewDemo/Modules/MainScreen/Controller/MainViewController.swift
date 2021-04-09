//
//  ViewController.swift
//  CollectionViewDemo
//
//  Created by Yoonha Kim on 4/7/21.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet private var collectionView: UICollectionView! {
        didSet {
            collectionView.dataSource = self
            collectionView.delegate = self
            let nib = UINib.init(nibName: "NewsCollectionViewCell", bundle:nil)
            self.collectionView.register(nib, forCellWithReuseIdentifier: "NewsCollectionViewCell")
            let headerNib = UINib.init(nibName: "NewsCollectionsHeader", bundle:nil)
            self.collectionView.register(headerNib, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: NewsCollectionsHeader.reuseIdentifier)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Recent News"
        let url = "https://test.spaceflightnewsapi.net/api/v2/articles?_limit=10"
        fetchItem(url)
    }
    
    private var dataSource: News? {
        didSet {
            collectionView.reloadData()
        }
    }
    
    func fetchItem(_ urlFrom: String) {
        NetworkManager.manager.fetch(url: urlFrom) { [weak self](result: Result<News, AppError>) in
            guard let self = self else { return }
            switch result {
            case .success(let newsData):
                self.dataSource = newsData
            case .failure(let error):
                print(error)
            }
        }
    }
}

extension MainViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        dataSource?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let sendData = self.dataSource?[indexPath.row] else { fatalError("no cell") }
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NewsCollectionViewCell.reuseIdentifier,
                                                            for: indexPath) as? NewsCollectionViewCell else { return UICollectionViewCell() }
        cell.configure(data: sendData)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        guard let header = collectionView.dequeueReusableSupplementaryView(
                ofKind: UICollectionView.elementKindSectionHeader,
                withReuseIdentifier: NewsCollectionsHeader.reuseIdentifier,
                for: indexPath)
                as? NewsCollectionsHeader
        else { return
            UICollectionReusableView() }
        return header
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        CGSize(width: self.collectionView.bounds.width, height: 100 )
    }
}
