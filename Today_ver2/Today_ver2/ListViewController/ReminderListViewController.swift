//
//  ViewController.swift
//  Today_ver2
//
//  Created by Mikiko Koda on 2022/09/13.
//

import UIKit

class ReminderListViewController: UICollectionViewController {
    typealias SnapShot = NSDiffableDataSourceSnapshot<Int, String>
    
    var dataSource: DataSource!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let listLayout = listLayout()
        collectionView.collectionViewLayout = listLayout
        
        let cellRegistration = UICollectionView.CellRegistration(handler: cellRegistrationHandler)

        dataSource = DataSource(collectionView: collectionView) { (collectionView: UICollectionView, indexPath: IndexPath, itemIdentifier: String) in
            return collectionView.dequeueConfiguredReusableCell(using: cellRegistration, for: indexPath, item: itemIdentifier)
        }
        var snapshot = SnapShot()
        snapshot.appendSections([0])
        snapshot.appendItems(Reminder.sampleData.map { $0.title })
        dataSource.apply(snapshot)
        
        collectionView.dataSource = dataSource
    }

    private func listLayout() -> UICollectionViewCompositionalLayout {
        var listConfigration = UICollectionLayoutListConfiguration(appearance: .grouped)
        listConfigration.showsSeparators = false
        listConfigration.backgroundColor = .clear
        return UICollectionViewCompositionalLayout.list(using: listConfigration)
    }
}

