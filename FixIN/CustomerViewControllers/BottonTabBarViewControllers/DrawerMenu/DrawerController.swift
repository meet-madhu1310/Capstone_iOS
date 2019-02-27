//
//  DrawerController.swift
//  FixIN
//
//  Created by Meet Madhu on 2019-02-27.
//  Copyright © 2019 Meet Madhu. All rights reserved.
//

import UIKit

class DrawerController: UIViewController, RootViewControllerDelegate {
    var rootViewController: RootViewController
    var menuController: MenuViewController
    
    var isMenuExpanded: Bool = false
    let overlayView = UIView()
    
    let button = UIButton(frame: CGRect(x: 50, y: 200, width: 150, height: 50))
    
    init(rootViewController: RootViewController, menuController: MenuViewController) {
        self.rootViewController = rootViewController
        self.menuController = menuController
        super.init(nibName: nil, bundle: nil)
        self.rootViewController.drawerDelegate = self
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.addChild(rootViewController)
        self.view.addSubview(rootViewController.view)
        rootViewController.didMove(toParent: self)
        
        overlayView.backgroundColor = .black
        overlayView.alpha = 0
        view.addSubview(overlayView)
        
        self.menuController.view.frame = CGRect(x: 0, y: 0, width: 0, height: self.view.bounds.height)
        self.addChild(menuController)
        self.view.addSubview(menuController.view)
        menuController.didMove(toParent: self)
        
        configureGestures()
        
        UIView.animate(withDuration: 0.3, animations: {
            self.button.isHidden = false
        }) { (success) in }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        overlayView.frame = view.bounds
        let width: CGFloat = (isMenuExpanded) ? view.bounds.width * 2 / 3 : 0.0
        self.menuController.view.frame = CGRect(x: 0, y: 0, width: width , height: self.view.bounds.height)
    }
    
    func toggleMenu() {
        isMenuExpanded = !isMenuExpanded
        let bounds = self.view.bounds
        let width: CGFloat = (isMenuExpanded) ? bounds.width * 2 / 3 : 0.0
        
        UIView.animate(withDuration: 0.3, animations: {
            self.menuController.view.frame = CGRect(x: 0, y: 0, width: width, height: bounds.height)
            self.overlayView.alpha = (self.isMenuExpanded) ? 0.5 : 0.0
        }) { (success) in }
        
        UIView.animate(withDuration: 0.5, animations: {
            self.button.backgroundColor = .clear
            
            self.button.titleLabel?.font = UIFont(name: "System Font", size: 30.0)
            self.button.setTitleColor(UIColor.black, for: .normal)
            self.button.setTitle("Logout", for: .normal)
            self.button.addTarget(self, action: #selector(self.buttonAction), for: .touchUpInside)
            
            self.view.addSubview(self.button)
            self.button.isHidden = false
        }) { (success) in }
    }
    
    @objc func buttonAction(sender: UIButton!) {
        print("Tapped.")
    }
    
    func navigateTo(viewController: UIViewController) {
        rootViewController.setViewControllers([viewController], animated: true)
        self.toggleMenu()
    }
    
    fileprivate func configureGestures() {
        let swipeLeftGesture = UISwipeGestureRecognizer(target: self, action: #selector(didSwipeLeft))
        swipeLeftGesture.direction = .left
        overlayView.addGestureRecognizer(swipeLeftGesture)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(didTapOverlay))
        overlayView.addGestureRecognizer(tapGesture)
    }
    
    @objc fileprivate func didSwipeLeft() {
        toggleMenu()
        
        UIView.animate(withDuration: 0.4, animations: {
            self.button.isHidden = true
        }) { (success) in }
    }
    
    @objc fileprivate func didTapOverlay() {
        toggleMenu()
        
        UIView.animate(withDuration: 0.4, animations: {
            self.button.isHidden = true
        }) { (success) in }
    }
}

extension DrawerController {
    func rootViewControllerDidTapMenuButton(_ rootViewController: RootViewController) {
        toggleMenu()
        
        UIView.animate(withDuration: 0.5, animations: {
            self.button.isHidden = false
        }) { (success) in }
    }
}

