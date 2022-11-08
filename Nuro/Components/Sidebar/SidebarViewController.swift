//
//  SidebarViewController.swift
//  Nuro
//
//  Created by Samuel Dennis on 06/10/22.
//

import UIKit
import SnapKit
import Combine

@available(iOS 14, *)
class SidebarViewController: UIViewController {
    
    private enum SidebarItemType: Int {
        case header, expandableRow, row
    }
    
    private enum SidebarSection: Int {
        case parentSection, childSection, settingsSection
    }
    
    private struct SidebarItem: Hashable, Identifiable {
        let id: UUID
        let type: SidebarItemType
        let title: String?
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
        static let settingsPage = UUID()
    }
    
    private var collectionViewMain: UICollectionView!
    private var collectionViewSetting: UICollectionView!
    private var dataSourceMain: UICollectionViewDiffableDataSource<SidebarSection, SidebarItem>!
    private var dataSourceSetting: UICollectionViewDiffableDataSource<SidebarSection, SidebarItem>!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.tintColor = Colors.Brand.blueViolet
        view.backgroundColor = Colors.Brand.jasmine
        
        configureCollectionView()
        configureDataSource()
        applyInitialSnapshot()
        
        collectionViewMain.selectItem(at: [0,1], animated: true, scrollPosition: .top)
    }
    
}

@available(iOS 14, *)
extension SidebarViewController {
    
    private func configureCollectionView() {
        collectionViewMain = UICollectionView(frame: view.bounds, collectionViewLayout: createLayout())
        collectionViewMain.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        collectionViewMain.backgroundColor = .systemBackground
        collectionViewMain.isScrollEnabled = false
        collectionViewMain.delegate = self
        
        collectionViewSetting = UICollectionView(frame: view.bounds, collectionViewLayout: createLayout())
        collectionViewSetting.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        collectionViewSetting.backgroundColor = .systemBackground
        collectionViewSetting.isScrollEnabled = false
        collectionViewSetting.delegate = self
        
        view.addSubview(collectionViewMain)
        view.addSubview(collectionViewSetting)
        
        collectionViewMain.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.left.right.equalToSuperview()
            make.height.equalTo(ScreenSizes.screenHeight * 0.85)
        }
        
        collectionViewSetting.snp.makeConstraints { make in
            make.top.equalTo(collectionViewMain.snp.bottom)
            make.left.right.bottom.equalToSuperview()
        }
        
    }
    
    private func createLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewCompositionalLayout() { (sectionIndex, layoutEnvironment) -> NSCollectionLayoutSection? in
            var configuration = UICollectionLayoutListConfiguration(appearance: .sidebar)
            configuration.showsSeparators = false
            configuration.headerMode = .firstItemInSection
            configuration.backgroundColor = Colors.Brand.floralWhite
            let section = NSCollectionLayoutSection.list(using: configuration, layoutEnvironment: layoutEnvironment)
            return section
        }
        return layout
    }
}

@available(iOS 14, *)
extension SidebarViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if collectionView == self.collectionViewMain {
            guard let sidebarItem = dataSourceMain.itemIdentifier(for: indexPath) else { return }
            
            switch indexPath.section {
            case SidebarSection.parentSection.rawValue:
                didSelectParentItem(sidebarItem, at: indexPath)
            case SidebarSection.childSection.rawValue:
                didSelectChildItem(sidebarItem, at: indexPath)
            default:
                collectionView.deselectItem(at: indexPath, animated: true)
            }
        }
        else {
            guard let sidebarSetting = dataSourceSetting.itemIdentifier(for: indexPath) else { return }
            
            didSelectSettingsItem(sidebarSetting, at: indexPath)
        }

    }
    
    private func didSelectParentItem(_ sidebarItem: SidebarItem, at indexPath: IndexPath) {
        switch sidebarItem.id {
        case RowIdentifier.parentTodayActivity:
            let navCon = UINavigationController(rootViewController: ParentTodayActivityViewController())
            deselectSettingsCell()
            splitViewController?.setViewController(navCon, for: .secondary)
            
        case RowIdentifier.parentRoutine:
            let navCon = UINavigationController(rootViewController: ParentRoutineViewController())
            deselectSettingsCell()
            splitViewController?.setViewController(navCon, for: .secondary)
            
        case RowIdentifier.parentActivityList:
            let navCon = UINavigationController(rootViewController: ParentActivityListViewController())
            deselectSettingsCell()
            splitViewController?.setViewController(navCon, for: .secondary)
            
        default:
            collectionViewMain.deselectItem(at: indexPath, animated: true)
        }
    }
    
    private func didSelectChildItem(_ sidebarItem: SidebarItem, at indexPath: IndexPath) {
        switch sidebarItem.id {
        case RowIdentifier.childRoutine:
            let navCon = UINavigationController(rootViewController: ParentChildRoutineViewController())
            deselectSettingsCell()
            splitViewController?.setViewController(navCon, for: .secondary)
            
        default:
            collectionViewMain.deselectItem(at: indexPath, animated: true)
        }
    }
    
    private func didSelectSettingsItem(_ sidebarItem: SidebarItem, at indexPath: IndexPath) {
        switch sidebarItem.id {
            
        case RowIdentifier.settingsPage:
            let navCon = UINavigationController(rootViewController: SettingViewController())
            deselectMainCells()
            splitViewController?.setViewController(navCon, for: .secondary)
            
        default:
            collectionViewMain.deselectItem(at: indexPath, animated: true)
        }
    }
    
    func deselectMainCells() {
        let selectedItems = collectionViewMain.indexPathsForSelectedItems
        for indexPath in selectedItems! {
            collectionViewMain.deselectItem(at: indexPath, animated:true)
        }
    }
    
    func deselectSettingsCell() {
        let selectedItems = collectionViewSetting.indexPathsForSelectedItems
        for indexPath in selectedItems! {
            collectionViewSetting.deselectItem(at: indexPath, animated:true)
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
            contentConfiguration.textProperties.font = UIFont(name: Fonts.VisbyRoundCF.bold, size: 32)!
            contentConfiguration.textProperties.color = Colors.Text.onyx
            
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
            contentConfiguration.textProperties.font = UIFont(name: Fonts.VisbyRoundCF.medium, size: 20)!
            contentConfiguration.secondaryText = item.subtitle
            contentConfiguration.image = item.image
            
            cell.contentConfiguration = contentConfiguration
        }
        
        dataSourceMain = UICollectionViewDiffableDataSource<SidebarSection, SidebarItem>(collectionView: collectionViewMain) {
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
        
        dataSourceSetting = UICollectionViewDiffableDataSource<SidebarSection, SidebarItem>(collectionView: collectionViewSetting) {
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
    
    private func settingsSnapshot() -> NSDiffableDataSourceSectionSnapshot<SidebarItem> {
        var snapshot = NSDiffableDataSourceSectionSnapshot<SidebarItem>()
        let header = SidebarItem.header(title: "")
        let items: [SidebarItem] = [
            .row(title: TabBarItem.settingsPage.title(), subtitle: nil, image: TabBarItem.settingsPage.image(), id: RowIdentifier.settingsPage)
        ]
        
        snapshot.append([header])
        snapshot.expand([header])
        snapshot.append(items, to: header)
        return snapshot
    }
    
    private func applyInitialSnapshot() {
        dataSourceMain.apply(parentSnapshot(), to: .parentSection, animatingDifferences: false)
        dataSourceMain.apply(childSnapshot(), to: .childSection, animatingDifferences: false)
        dataSourceSetting.apply(settingsSnapshot(), to: .settingsSection, animatingDifferences: false)
    }
}
