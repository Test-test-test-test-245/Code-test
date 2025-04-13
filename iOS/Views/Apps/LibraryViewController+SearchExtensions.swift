// Proprietary Software License Version 1.0
//
// Copyright (C) 2025 BDG
//
// Backdoor App Signer is proprietary software. You may not use, modify, or distribute it except as expressly
// permitted under the terms of the Proprietary Software License.

import UIKit

// MARK: - Search Extensions for LibraryViewController

extension LibraryViewController {
    /// Configure the search controller for app filtering
    func configureSearchBar() {
        searchController = UISearchController(searchResultsController: nil)
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search"
        
        navigationItem.searchController = searchController
        definesPresentationContext = true
        navigationItem.hidesSearchBarWhenScrolling = false
    }
    
    /// Check if search filtering is active
    var isFiltering: Bool {
        return searchController.isActive && !searchBarIsEmpty
    }
    
    /// Check if search bar is empty
    var searchBarIsEmpty: Bool {
        return searchController.searchBar.text?.isEmpty ?? true
    }
}

// MARK: - UISearchResultsUpdating Implementation
extension LibraryViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        let searchText = searchController.searchBar.text ?? ""
        filterContentForSearchText(searchText)
        tableView.reloadData()
    }
    
    /// Filter app content based on search text
    private func filterContentForSearchText(_ searchText: String) {
        let lowercasedSearchText = searchText.lowercased()
        
        filteredSignedApps = signedApps?.filter { app in
            guard let name = app.name?.lowercased() else { return false }
            return name.contains(lowercasedSearchText)
        } ?? []
        
        filteredDownloadedApps = downloadedApps?.filter { app in
            guard let name = app.name?.lowercased() else { return false }
            return name.contains(lowercasedSearchText)
        } ?? []
    }
}

// MARK: - UISearchControllerDelegate Implementation
extension LibraryViewController: UISearchControllerDelegate, UISearchBarDelegate {
    // Can be expanded with additional search-related methods as needed
}

// MARK: - UI Helper Extensions
extension LibraryViewController {
    /// Create and configure a loading alert with spinner
    func createLoaderAlert() -> UIAlertController {
        let alert = UIAlertController(
            title: nil,
            message: "Please wait...",
            preferredStyle: .alert
        )
        
        let loadingIndicator = UIActivityIndicatorView(frame: CGRect(x: 10, y: 5, width: 50, height: 50))
        loadingIndicator.hidesWhenStopped = true
        loadingIndicator.style = .medium
        loadingIndicator.startAnimating()
        
        alert.view.addSubview(loadingIndicator)
        
        // Add constraints for proper layout
        loadingIndicator.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            loadingIndicator.centerXAnchor.constraint(equalTo: alert.view.centerXAnchor),
            loadingIndicator.centerYAnchor.constraint(equalTo: alert.view.centerYAnchor),
        ])
        
        return alert
    }
}
