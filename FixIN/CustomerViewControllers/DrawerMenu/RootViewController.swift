//
//  RootViewController.swift
//  FixIN
//
//  Created by Meet Madhu on 2019-02-27.
//  Copyright © 2019 Meet Madhu. All rights reserved.
//

import UIKit

protocol RootViewControllerDelegate: class {
    func rootViewControllerDidTapMenuButton(_ rootViewController: RootViewController)
}

class RootViewController: UINavigationController, UINavigationControllerDelegate {
    
    fileprivate var menuButton: UIBarButtonItem!
    fileprivate var topNavigationRightImage: UIImage?
    weak var drawerDelegate: RootViewControllerDelegate?
    
    public init(mainViewController: UIViewController, topNavigationRightImage: UIImage?) {
        super.init(rootViewController: mainViewController)
        self.topNavigationRightImage = topNavigationRightImage
        menuButton = UIBarButtonItem(image: topNavigationRightImage, style: .plain, target: self, action: #selector(handleMenuButton))
    }
    
    public override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
    }
    
    public func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool) {
        prepareNavigationBar()
    }

}

extension RootViewController {
    fileprivate func prepareNavigationBar() {
        topViewController?.navigationItem.title = topViewController?.title
        if self.viewControllers.count <= 1 {
            topViewController?.navigationItem.rightBarButtonItem = menuButton
            topViewController?.navigationItem.rightBarButtonItem?.tintColor = UIColor.white
        }
    }
}

extension RootViewController {
    @objc
    fileprivate func handleMenuButton() {
        drawerDelegate?.rootViewControllerDidTapMenuButton(self)
    }
}

