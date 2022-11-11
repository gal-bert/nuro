//
//  SearchController.swift
//  Nuro
//
//  Created by Finn Christoffer Kurniawan on 20/10/22.
//
import UIKit
import Foundation

class SearchController: UISearchController, UISearchResultsUpdating {
    
    var searchDelegate: SearchControllerDelegate!
    
    func updateSearchResults(for searchController: UISearchController) {
        let searchBar = searchController.searchBar
        let searchText = searchBar.text!
        
        guard let text = searchController.searchBar.text else {
            return
        }
        searchDelegate.getResult(text: text)
    }
    
    private func createWhiteBG(_ frame : CGSize) -> UIImage? {
        var rect = CGRect(x: 0, y: 0, width: 0, height: 0)
        rect.size = frame
        UIGraphicsBeginImageContext(rect.size)
        let context = UIGraphicsGetCurrentContext()
        context?.setFillColor(Colors.Brand.floralWhite.cgColor)
        context?.fill(rect)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }
    
    func setupSearchController(vc: UIViewController) {
        
        let searchController = UISearchController(searchResultsController: nil)
        let size = CGSize(width: searchController.searchBar.frame.size.width-12, height: searchController.searchBar.frame.size.height-12)
        let bgImageSearchBar = createWhiteBG(size)!
        let imageWithCorner = bgImageSearchBar.createImageWithRoundBorder(cornerRadius: 10)!
        searchController.searchBar.setSearchFieldBackgroundImage(imageWithCorner, for: UIControl.State.normal)
        searchController.searchBar.searchTextField.textColor = Colors.Text.onyx
        searchController.searchBar.placeholder = "Aktivitas, Kegiatan, Pekerjaan Rumah..."
        searchController.searchBar.searchTextField.font = UIFont(name: Fonts.VisbyRoundCF.regular, size: 20)
        searchController.searchBar.autocapitalizationType = .none
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.searchBarStyle = UISearchBar.Style.minimal
        vc.navigationItem.searchController = searchController
        vc.navigationItem.hidesSearchBarWhenScrolling = false
        searchController.searchResultsUpdater = self
        if #available(iOS 16, *){
            vc.navigationItem.preferredSearchBarPlacement = .stacked
        }
        
    }
}

