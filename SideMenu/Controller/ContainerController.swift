//
//  ContainerController.swift
//  SideMenu
//
//  Created by YE002 on 07/07/23.
//

import UIKit

class ContainerController: UIViewController {
    
    // MARK: - Properties
    
    var menuController: MenuController!
    var homeNav: UIViewController!
    var isExpanded = false
    
    // MARK: - Init
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureHomeController()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override var preferredStatusBarUpdateAnimation: UIStatusBarAnimation {
        return .slide
    }
    
    override var prefersStatusBarHidden: Bool {
        return isExpanded
    }
    
    // MARK: - Handlers
    
    func configureHomeController() {
        let homeController = HomeController()
        homeController.delegate = self
        homeNav = UINavigationController(rootViewController: homeController)
        
        view.addSubview(homeNav.view)
        addChild(homeNav)
        homeNav.didMove(toParent: self)
    }
    
    func configureMenuController() {
        if menuController == nil {
            // add our menu controller here
            menuController = MenuController()
            menuController.delegate = self
            view.insertSubview(menuController.view, at: 0)
            addChild(menuController)
            menuController.didMove(toParent: self)
        }
    }
    
    func animatePanel(shouldExpand: Bool, menuOption: MenuOptions?) {
        
        if shouldExpand {
            // show menu
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
                self.homeNav.view.frame.origin.x = self.homeNav.view.frame.width - 80
            }, completion: nil)
            
        } else {
            // hide menu
           
            
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, animations: {
                self.homeNav.view.frame.origin.x = 0
            }) { _ in
                guard let menuOption = menuOption else { return }
                self.didSelectMenuOption(menuOption: menuOption)
            }
        }
        animateStatusBar()
    }
    
    func didSelectMenuOption(menuOption: MenuOptions) {
        switch menuOption {
            
        case .Profile:
            print("Show Profile")
        case .Inbox:
            print("Show Inbox")
        case .Notifications:
            print("Show Notifications")
        case .Settings:
            print("Show Settings")
        }
    }
    
    func animateStatusBar() {
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
            self.setNeedsStatusBarAppearanceUpdate()
        }, completion: nil)

    }
    
}

extension ContainerController: HomeControllerDelegate {
    func handleMenuToggle(forMenuOptions menuOptions: MenuOptions?) {
        if !isExpanded {
            configureMenuController()
        }
        
        isExpanded = !isExpanded
        animatePanel(shouldExpand: isExpanded, menuOption: menuOptions)
    }
}

