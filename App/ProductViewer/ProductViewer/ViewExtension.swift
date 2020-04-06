//
//  UIViewControllerExtension.swift
//  ProductViewer
//
//  Created by Imayaselvan  on 02/04/20.
//  Copyright © 2020 Target. All rights reserved.
//

import UIKit

extension UIViewController {
    var service: Service {
        return Service.shared
    }
}

extension UIViewController {
    func displayalert(title:String, message:String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction((UIAlertAction(title: "OK", style: .default, handler: { (action) -> Void in
            alert.dismiss(animated: true, completion: nil)
            
        })))
        
        self.present(alert, animated: true, completion: nil)
        
    }
     ///TODO : Should Segregate NavBar Implementation
    func showCloseBtn() {
        navigationItem.title = ""
        let closeItem = UIBarButtonItem(image: UIImage(named: "close"), style: .plain, target: self, action: #selector(closeButtonClicked))
        closeItem.tintColor = UIColor.black
        self.navigationItem.leftBarButtonItem  = closeItem
        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = false
    }
  
    //Empty Implemtation
    @objc func closeButtonClicked() {
        self.dismiss(animated: true, completion: nil)
    }

}

@IBDesignable extension UIView {
    @IBInspectable var borderColor: UIColor? {
        set {
            layer.borderColor = newValue?.cgColor
        }
        get {
            guard let color = layer.borderColor else {
                return nil
            }
            return UIColor(cgColor: color)
        }
    }
    @IBInspectable var borderWidth: CGFloat {
        set {
            layer.borderWidth = newValue
        }
        get {
            return layer.borderWidth
        }
    }
    @IBInspectable var cornerRadius: CGFloat {
        set {
            layer.cornerRadius = newValue
            clipsToBounds = newValue > 0
        }
        get {
            return layer.cornerRadius
        }
    }
}


class Layout {
    class func fill(_ view: UIView, superview: UIView) {
        view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            view.topAnchor.constraint(equalTo: superview.topAnchor),
            view.bottomAnchor.constraint(equalTo: superview.bottomAnchor),
            view.leadingAnchor.constraint(equalTo: superview.leadingAnchor),
            view.trailingAnchor.constraint(equalTo: superview.trailingAnchor),
        ])
    }
}

extension UIView {
    class func fromNib<T: UIView>() -> T {
        return Bundle(for: T.self).loadNibNamed(String(describing: T.self), owner: nil, options: nil)![0] as! T
    }
}

