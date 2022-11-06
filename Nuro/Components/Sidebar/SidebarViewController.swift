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
        case header, headerHide, expandableRow, row
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
        
        static func headerHide(title: String, id: UUID = UUID()) -> Self {
            return SidebarItem(id: id, type: .headerHide, title: title, subtitle: nil, image: nil)
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
    private var collectionView1: UICollectionView!
    private var dataSource: UICollectionViewDiffableDataSource<SidebarSection, SidebarItem>!
    private var dataSource1: UICollectionViewDiffableDataSource<SidebarSection, SidebarItem>!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.tintColor = Colors.Brand.blueViolet
        //        view.tintColor = Colors.Brand.blueViolet
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
//        let frame = CGRect(x: 0, y: 0, width: ScreenSizes.screenWidth, height: 500)
        collectionViewMain = UICollectionView(frame: view.bounds, collectionViewLayout: createLayout())

        collectionViewMain.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        collectionViewMain.backgroundColor = .systemBackground
        collectionViewMain.isScrollEnabled = false
        collectionViewMain.delegate = self
        view.addSubview(collectionViewMain)
        
//        let segmentedControl: UISegmentedControl = {
//            let view = UISegmentedControl(items: ["Senin", "Selasa", "Rabu", "Kamis", "Jumat", "Sabtu", "Minggu"])
//            view.selectedSegmentIndex = 0
//            return view
//        }()
//        
//        view.addSubview(segmentedControl)
//        
//        lazy var categoryLabel: UILabel = {
//            let view = UILabel()
//            view.textColor = Colors.Text.verseGreen
//            view.font = UIFont(name: Fonts.VisbyRoundCF.medium, size: 16)
//            view.text = "Kebersihan diri"
//            view.textAlignment = .right
//            return view
//        }()
//        
//        view.addSubview(categoryLabel)
        
//        let frame1 = CGRect(x: 0, y: 0, width: ScreenSizes.screenWidth, height: 500)
//        collectionView1 = UICollectionView(frame: frame1, collectionViewLayout: createLayout())
//
//        collectionView1.autoresizingMask = [.flexibleWidth, .flexibleHeight]
//        collectionView1.backgroundColor = .systemBackground
//        collectionView1.isScrollEnabled = false
//        collectionView1.delegate = self
//        view.addSubview(collectionView1)

        collectionView1 = UICollectionView(frame: view.bounds, collectionViewLayout: createLayout())

        collectionView1.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        collectionView1.backgroundColor = .systemBackground
        collectionView1.isScrollEnabled = false
        collectionView1.delegate = self
        
        view.addSubview(collectionView1)
        
        collectionViewMain.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.left.right.equalToSuperview()
            make.height.equalTo(ScreenSizes.screenHeight * 0.85)
        }
//
//        segmentedControl.snp.makeConstraints { make in
//            make.top.equalTo(collectionView.snp.bottom)
//        }
//
//        categoryLabel.snp.makeConstraints { make in
//            make.top.equalTo(segmentedControl.snp.bottom)
//        }
        
        collectionView1.snp.makeConstraints { make in
            make.top.equalTo(collectionViewMain.snp.bottom)
            make.left.right.equalToSuperview()
            make.height.equalTo(ScreenSizes.screenHeight * 0.85)
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
            print("collection view a")
            
            guard let sidebarItem = dataSource.itemIdentifier(for: indexPath) else { return }
    //        guard let sidebarSetting = dataSource1.itemIdentifier(for: indexPath) else { return }
            
            print(indexPath)
            
            switch indexPath.section {
            case SidebarSection.parentSection.rawValue:
                didSelectParentItem(sidebarItem, at: indexPath)
            case SidebarSection.childSection.rawValue:
                didSelectChildItem(sidebarItem, at: indexPath)
    //        case SidebarSection.settingsSection.rawValue:
    //            didSelectSettingsItem(sidebarSetting, at: indexPath)
            default:
                collectionView.deselectItem(at: indexPath, animated: true)
            }
        }
        else {
            print("b")
            
//            guard let sidebarItem = dataSource.itemIdentifier(for: indexPath) else { return }
            guard let sidebarSetting = dataSource1.itemIdentifier(for: indexPath) else { return }
            
            print(indexPath)
            
            didSelectSettingsItem(sidebarSetting, at: indexPath)
//            switch indexPath.section {
////            case SidebarSection.parentSection.rawValue:
////                didSelectParentItem(sidebarItem, at: indexPath)
////            case SidebarSection.childSection.rawValue:
////                didSelectChildItem(sidebarItem, at: indexPath)
//            case SidebarSection.settingsSection.rawValue:
//                print("nasuk")
//                didSelectSettingsItem(sidebarSetting, at: indexPath)
//            default:
//                collectionView.deselectItem(at: indexPath, animated: true)
//            }
        }

    }
    
//    func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
//        // get array of already selected index paths
//        if let a = collectionView.indexPathsForSelectedItems {
//            // if that array contains indexPath, that means
//            //  it is already selected, so
//            if a.contains(indexPath) {
//                // deselect it
//                collectionView.deselectItem(at: indexPath, animated: false)
//                return false
//            }
//        }
//        // no indexPaths (cells) were selected, so return true
//        return true
//    }
    
    func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        // get array of already selected index paths
        if let a = collectionView.indexPathsForSelectedItems {
            // if that array contains indexPath, that means
            //  it is already selected, so
            if a.contains(indexPath) {
                // deselect it
                collectionView.deselectItem(at: indexPath, animated: false)
                return false
            }
        }
        // no indexPaths (cells) were selected, so return true
        return true
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
            collectionViewMain.deselectItem(at: indexPath, animated: true)
        }
    }
    
    private func didSelectChildItem(_ sidebarItem: SidebarItem, at indexPath: IndexPath) {
        switch sidebarItem.id {
        case RowIdentifier.childRoutine:
            let navCon = UINavigationController(rootViewController: ParentChildRoutineViewController())
            splitViewController?.setViewController(navCon, for: .secondary)
        case RowIdentifier.settingsPage:
            let navCon = UINavigationController(rootViewController: ParentActivityListViewController())
            splitViewController?.setViewController(navCon, for: .secondary)
            
        default:
            collectionViewMain.deselectItem(at: indexPath, animated: true)
        }
    }
    
    private func didSelectSettingsItem(_ sidebarItem: SidebarItem, at indexPath: IndexPath) {
        switch sidebarItem.id {
            
        case RowIdentifier.settingsPage:
            let navCon = UINavigationController(rootViewController: ParentRoutineAddActivityViewController())
            splitViewController?.setViewController(navCon, for: .secondary)
            
        default:
            collectionViewMain.deselectItem(at: indexPath, animated: true)
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
        
        let headerHide = UICollectionView.CellRegistration<UICollectionViewListCell, SidebarItem> {
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
            //            contentConfiguration.textProperties.color = Colors.Text.onyx
            contentConfiguration.secondaryText = item.subtitle
            contentConfiguration.image = item.image
            //            contentConfiguration.imageProperties.tintColor = Colors.Brand.blueViolet
            
            cell.contentConfiguration = contentConfiguration
        }
        
        dataSource = UICollectionViewDiffableDataSource<SidebarSection, SidebarItem>(collectionView: collectionViewMain) {
            (collectionView, indexPath, item) -> UICollectionViewCell in
            
            switch item.type {
            case .header:
                return collectionView.dequeueConfiguredReusableCell(using: headerRegistration, for: indexPath, item: item)
            case .headerHide:
                return collectionView.dequeueConfiguredReusableCell(using: headerHide, for: indexPath, item: item)
            case .expandableRow:
                return collectionView.dequeueConfiguredReusableCell(using: expandableRowRegistration, for: indexPath, item: item)
            default:
                return collectionView.dequeueConfiguredReusableCell(using: rowRegistration, for: indexPath, item: item)
            }
        }
        
        dataSource1 = UICollectionViewDiffableDataSource<SidebarSection, SidebarItem>(collectionView: collectionView1) {
            (collectionView, indexPath, item) -> UICollectionViewCell in

            switch item.type {
            case .header:
                return collectionView.dequeueConfiguredReusableCell(using: headerRegistration, for: indexPath, item: item)
            case .headerHide:
                return collectionView.dequeueConfiguredReusableCell(using: headerHide, for: indexPath, item: item)
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
            .row(title: TabBarItem.settingsPage.title(), subtitle: nil, image: TabBarItem.settingsPage.image(), id: RowIdentifier.settingsPage)
        ]
        
        snapshot.append([header])
        snapshot.expand([header])
        snapshot.append(items, to: header)
        return snapshot
    }
    
    private func headerHideSnapshot() -> NSDiffableDataSourceSectionSnapshot<SidebarItem> {
        var snapshot = NSDiffableDataSourceSectionSnapshot<SidebarItem>()
        let header = SidebarItem.headerHide(title: "Tes")
        
        snapshot.append([header])
        snapshot.expand([header])
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
        dataSource.apply(parentSnapshot(), to: .parentSection, animatingDifferences: false)
        dataSource.apply(childSnapshot(), to: .childSection, animatingDifferences: false)
//        dataSource.apply(headerHideSnapshot(), to: .hideSection, animatingDifferences: false)
//        dataSource.apply(headerHideSnapshot(), to: .hideSection2, animatingDifferences: false)
//        dataSource.apply(headerHideSnapshot(), to: .hideSection3, animatingDifferences: false)
//        dataSource.apply(settingsSnapshot(), to: .settingsSection, animatingDifferences: false)
        dataSource1.apply(settingsSnapshot(), to: .settingsSection, animatingDifferences: false)
    }
    
    
}
