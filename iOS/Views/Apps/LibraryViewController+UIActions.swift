// Proprietary Software License Version 1.0
//
// Copyright (C) 2025 BDG
//
// Backdoor App Signer is proprietary software. You may not use, modify, or distribute it except as expressly
// permitted under the terms of the Proprietary Software License.

import UIKit
import CoreData

// MARK: - UI Action Extensions for LibraryViewController

extension LibraryViewController {
    /// Show certificate missing alert
    func showNoCertificatesAlert() {
        let alert = UIAlertController(
            title: String.localized("APP_SIGNING_VIEW_CONTROLLER_NO_CERTS_ALERT_TITLE"),
            message: String.localized("APP_SIGNING_VIEW_CONTROLLER_NO_CERTS_ALERT_DESCRIPTION"),
            preferredStyle: .alert
        )
        alert.addAction(UIAlertAction(title: String.localized("LAME"), style: .default))
        present(alert, animated: true)
    }
    
    /// Handle downloaded app actions
    func handleDownloadedAppAction(app: DownloadedApps, indexPath: IndexPath) {
        // Implementation would go here
        // This is a placeholder to match method signature used in code
    }
    
    /// Show confirmation alert for installing an app
    func showInstallConfirmationAlert(app: NSManagedObject, filePath: String) {
        // Implementation would go here
        // This is a placeholder to match method signature used in code
    }
    
    /// Configure popup detents for iOS 15+ sheet presentations
    func configurePopupDetents(hasUpdate: Bool) {
        // Implementation would go here
        // This is a placeholder to match method signature used in code
    }
    
    /// Configure the presentation detents of a popup view controller
    func configureSheetPresentationController(for viewController: UIViewController, hasUpdate: Bool = false) {
        if #available(iOS 15.0, *) {
            if let sheet = viewController.presentationController as? UISheetPresentationController {
                sheet.detents = [.medium(), .large()]
                sheet.prefersGrabberVisible = true
            }
        }
    }
}

// MARK: - Table View Extensions
extension LibraryViewController {
    // UITableView related overrides that comply with Swift rules
    
    // These don't have 'override' as they're in extension blocks
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        // Implementation would go here - placeholder
        return nil
    }
}
