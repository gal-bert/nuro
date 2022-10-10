//
//  SidebarViewController.swift
//  Nuro
//
//  Created by Samuel Dennis on 06/10/22.
//

import UIKit
import Combine

@available(iOS 14, *)
class SidebarViewController: UIViewController {

    private enum SidebarItemType: Int {
        case header, expandableRow, row
    }
    
    private enum SidebarSection: Int {
        case library, collections
    }
    
    private struct SidebarItem: Hashable, Identifiable {
        let id: UUID
        let type: SidebarItemType
        let title: String
        let subtitle: String?
        let image: UIImage?
        
        static func header(title: String, id: UUID = UUID()) -> Self {
            return SidebarItem(id: id, type: .header, title: title, subtitle: nil, image: nil)
        }

        static func expandableRow(title: String, subtitle: String?, image: UIImage?, id: UUID = UUID()) -> Self {
            return SidebarItem(id: id, type: .expandableRow, title: title, subtitle: subtitle, image: image)
        }

        static func row(title: String, subtitle: String?, image: UIImage?, id: UUID = UUID()) -> Self {
            return SidebarItem(id: id, type: .row, title: title, subtitle: subtitle, image: image)
        }
    }
    
    private struct RowIdentifier {
        static let todayActivity = UUID()
        static let listActivity = UUID()
        static let routine = UUID()
    }
    
    private var collectionView: UICollectionView!
    private var dataSource: UICollectionViewDiffableDataSource<SidebarSection, SidebarItem>!
    private var recipeCollectionsSubscriber: AnyCancellable?


    override func viewDidLoad() {
        super.viewDidLoad()

        configureCollectionView()
        configureDataSource()
        applyInitialSnapshot()
        
//        recipeCollectionsSubscriber = dataStore.$collections
//            .receive(on: RunLoop.main)
//            .sink { [weak self] _ in
//                guard let self = self else { return }
//                let snapshot = self.collectionsSnapshot()
//                self.dataSource.apply(snapshot, to: .collections, animatingDifferences: true)
//            }
    }

}

@available(iOS 14, *)
extension SidebarViewController {
    
    private func configureCollectionView() {
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: createLayout())
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        collectionView.backgroundColor = .systemBackground
        collectionView.delegate = self
        view.addSubview(collectionView)
    }
    
    private func createLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewCompositionalLayout() { (sectionIndex, layoutEnvironment) -> NSCollectionLayoutSection? in
            var configuration = UICollectionLayoutListConfiguration(appearance: .sidebar)
            configuration.showsSeparators = false
            configuration.headerMode = .firstItemInSection
            let section = NSCollectionLayoutSection.list(using: configuration, layoutEnvironment: layoutEnvironment)
            return section
        }
        return layout
    }

}

@available(iOS 14, *)
extension SidebarViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let sidebarItem = dataSource.itemIdentifier(for: indexPath) else { return }
        
        switch indexPath.section {
        case SidebarSection.library.rawValue:
            didSelectLibraryItem(sidebarItem, at: indexPath)
        case SidebarSection.collections.rawValue:
            didSelectCollectionsItem(sidebarItem, at: indexPath)
        default:
            collectionView.deselectItem(at: indexPath, animated: true)
        }
    }
    
    private func parentActivityListViewController() -> ParentActivityListViewController? {
        guard
            let splitViewController = self.splitViewController,
            let recipeListViewController = splitViewController.viewController(for: .supplementary)
        else { return nil }
        
        return recipeListViewController as? ParentActivityListViewController
    }
    
    private func didSelectLibraryItem(_ sidebarItem: SidebarItem, at indexPath: IndexPath) {
        guard let recipeListViewController = self.parentActivityListViewController() else { return }
        
        switch sidebarItem.id {
        case RowIdentifier.todayActivity:
            print("1")
//            recipeListViewController.showRecipes(.all)
        case RowIdentifier.listActivity:
            print("2")
//            recipeListViewController.showRecipes(.favorites)
        case RowIdentifier.routine:
            print("3")
//            recipeListViewController.showRecipes(.recents)
        default:
            collectionView.deselectItem(at: indexPath, animated: true)
        }
    }
    
    private func didSelectCollectionsItem(_ sidebarItem: SidebarItem, at indexPath: IndexPath) {
        if let recipeListViewController = self.parentActivityListViewController() {
            let collection = sidebarItem.title
//            recipeListViewController.showRecipes(from: collection)
        }
    }
    
}

@available(iOS 14, *)
extension SidebarViewController {
    private func configureDataSource() {
        let headerRegistration = UICollectionView.CellRegistration<UICollectionViewListCell, SidebarItem> {
            (cell, indexPath, item) in
            
            var contentConfiguration = UIListContentConfiguration.sidebarHeader()
            contentConfiguration.text = item.title
            contentConfiguration.textProperties.font = .systemFont(ofSize: 32)
            contentConfiguration.textProperties.color = .purple
            
            cell.contentConfiguration = contentConfiguration
            cell.accessories = [.outlineDisclosure()]
        }
        
        let expandableRowRegistration = UICollectionView.CellRegistration<UICollectionViewListCell, SidebarItem> {
            (cell, indexPath, item) in
            
            var contentConfiguration = UIListContentConfiguration.sidebarSubtitleCell()
            contentConfiguration.text = item.title
            contentConfiguration.secondaryText = item.subtitle
            contentConfiguration.image = item.image
            
            cell.contentConfiguration = contentConfiguration
            cell.accessories = [.outlineDisclosure()]
        }
        
        let rowRegistration = UICollectionView.CellRegistration<UICollectionViewListCell, SidebarItem> {
            (cell, indexPath, item) in
            
            var contentConfiguration = UIListContentConfiguration.sidebarSubtitleCell()
            contentConfiguration.text = item.title
            contentConfiguration.secondaryText = item.subtitle
            contentConfiguration.image = item.image
            
            cell.contentConfiguration = contentConfiguration
        }
        
        dataSource = UICollectionViewDiffableDataSource<SidebarSection, SidebarItem>(collectionView: collectionView) {
            (collectionView, indexPath, item) -> UICollectionViewCell in
            
            switch item.type {
            case .header:
                return collectionView.dequeueConfiguredReusableCell(using: headerRegistration, for: indexPath, item: item)
            case .expandableRow:
                return collectionView.dequeueConfiguredReusableCell(using: expandableRowRegistration, for: indexPath, item: item)
            default:
                return collectionView.dequeueConfiguredReusableCell(using: rowRegistration, for: indexPath, item: item)
            }
        }
    }
    
    private func librarySnapshot() -> NSDiffableDataSourceSectionSnapshot<SidebarItem> {
        var snapshot = NSDiffableDataSourceSectionSnapshot<SidebarItem>()
        let header = SidebarItem.header(title: "Orang Tua")
        let items: [SidebarItem] = [
            .row(title: TabBarItem.parentTodayActivity.title(), subtitle: nil, image: TabBarItem.parentTodayActivity.image(), id: RowIdentifier.todayActivity),
            .row(title: TabBarItem.parentActivityList.title(), subtitle: nil, image: TabBarItem.parentActivityList.image(), id: RowIdentifier.listActivity),
            .row(title: TabBarItem.parentRoutine.title(), subtitle: nil, image: TabBarItem.parentRoutine.image(), id: RowIdentifier.routine)
        ]
        
        snapshot.append([header])
        snapshot.expand([header])
        snapshot.append(items, to: header)
        return snapshot
    }
    
//    private func collectionsSnapshot() -> NSDiffableDataSourceSectionSnapshot<SidebarItem> {
//        var snapshot = NSDiffableDataSourceSectionSnapshot<SidebarItem>()
//        let header = SidebarItem.header(title: TabBarItem.collections.title())
//        let image = TabBarItem.collections.image()
//
//        var items = [SidebarItem]()
////        for collectionName in dataStore.collections {
////            items.append(.row(title: collectionName, subtitle: nil, image: image))
////        }
//
//        snapshot.append([header])
//        snapshot.expand([header])
//        snapshot.append(items, to: header)
//        return snapshot
//    }
    
    private func applyInitialSnapshot() {
        dataSource.apply(librarySnapshot(), to: .library, animatingDifferences: false)
//        dataSource.apply(collectionsSnapshot(), to: .collections, animatingDifferences: false)
    }
    
    
}
