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
        case parentSection, childSection
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
        static let parentTodayActivity = UUID()
        static let parentRoutine = UUID()
        static let parentActivityList = UUID()
        static let childRoutine = UUID()
    }
    
    private var collectionView: UICollectionView!
    private var dataSource: UICollectionViewDiffableDataSource<SidebarSection, SidebarItem>!


    override func viewDidLoad() {
        super.viewDidLoad()

        configureCollectionView()
        configureDataSource()
        applyInitialSnapshot()
        
        collectionView.selectItem(at: [0,1], animated: true, scrollPosition: .top)
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
        case SidebarSection.parentSection.rawValue:
            didSelectParentItem(sidebarItem, at: indexPath)
        case SidebarSection.childSection.rawValue:
            didSelectChildItem(sidebarItem, at: indexPath)
        default:
            collectionView.deselectItem(at: indexPath, animated: true)
        }
    }
    
    private func didSelectParentItem(_ sidebarItem: SidebarItem, at indexPath: IndexPath) {
        switch sidebarItem.id {
        case RowIdentifier.parentTodayActivity:
            let navCon = UINavigationController(rootViewController: ParentTodayActivityViewController())
            splitViewController?.setViewController(navCon, for: .secondary)
            
        case RowIdentifier.parentRoutine:
            let navCon = UINavigationController(rootViewController: ParentRoutineViewController())
            splitViewController?.setViewController(navCon, for: .secondary)
            
        case RowIdentifier.parentActivityList:
            let navCon = UINavigationController(rootViewController: ParentActivityListViewController())
            splitViewController?.setViewController(navCon, for: .secondary)
            
        default:
            collectionView.deselectItem(at: indexPath, animated: true)
        }
    }
    
    private func didSelectChildItem(_ sidebarItem: SidebarItem, at indexPath: IndexPath) {
        switch sidebarItem.id {
        case RowIdentifier.childRoutine:
            let navCon = UINavigationController(rootViewController: ChildRoutineViewController())
            splitViewController?.setViewController(navCon, for: .secondary)
            
        default:
            collectionView.deselectItem(at: indexPath, animated: true)
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
        }
        
        let expandableRowRegistration = UICollectionView.CellRegistration<UICollectionViewListCell, SidebarItem> {
            (cell, indexPath, item) in
            
            var contentConfiguration = UIListContentConfiguration.sidebarSubtitleCell()
            contentConfiguration.text = item.title
            contentConfiguration.secondaryText = item.subtitle
            contentConfiguration.image = item.image
            
            cell.contentConfiguration = contentConfiguration
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
    
    private func parentSnapshot() -> NSDiffableDataSourceSectionSnapshot<SidebarItem> {
        var snapshot = NSDiffableDataSourceSectionSnapshot<SidebarItem>()
        let header = SidebarItem.header(title: "Orang Tua")
        let items: [SidebarItem] = [
            .row(title: TabBarItem.parentTodayActivity.title(), subtitle: nil, image: TabBarItem.parentTodayActivity.image(), id: RowIdentifier.parentTodayActivity),
            .row(title: TabBarItem.parentRoutine.title(), subtitle: nil, image: TabBarItem.parentRoutine.image(), id: RowIdentifier.parentRoutine),
            .row(title: TabBarItem.parentActivityList.title(), subtitle: nil, image: TabBarItem.parentActivityList.image(), id: RowIdentifier.parentActivityList)
        ]
        
        snapshot.append([header])
        snapshot.expand([header])
        snapshot.append(items, to: header)
        return snapshot
    }
    
    private func childSnapshot() -> NSDiffableDataSourceSectionSnapshot<SidebarItem> {
        var snapshot = NSDiffableDataSourceSectionSnapshot<SidebarItem>()
        let header = SidebarItem.header(title: "Anak")
        let items: [SidebarItem] = [
            .row(title: TabBarItem.childRoutine.title(), subtitle: nil, image: TabBarItem.childRoutine.image(), id: RowIdentifier.childRoutine),
        ]
        
        snapshot.append([header])
        snapshot.expand([header])
        snapshot.append(items, to: header)
        return snapshot
    }
    
    private func applyInitialSnapshot() {
        dataSource.apply(parentSnapshot(), to: .parentSection, animatingDifferences: false)
        dataSource.apply(childSnapshot(), to: .childSection, animatingDifferences: false)
    }
    
    
}
