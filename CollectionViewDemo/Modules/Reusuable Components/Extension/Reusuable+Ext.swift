//
//  Reusuable+Extension.swift
//  CollectionViewDemo
//
//  Created by Yoonha Kim on 4/8/21.
//

import UIKit

protocol AlertProtocol {}
extension AlertProtocol where Self: UIViewController {
        func showAlert(title: String, message: String, button: [String], completion: @escaping (Int, UIAlertAction) -> Void) {
        }
    }

enum AlertButton: String {
    case ok
    case cancel
    case delete
    case settings
}

protocol CellReusable {
    static var reuseIdentifier: String { get }
}

extension CellReusable {
    static var reuseIdentifier: String {
         String(describing: self)
    }
}
