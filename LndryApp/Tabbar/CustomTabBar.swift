//
//  CustomTabBar.swift
//  LndryApp
//
//  Created by Muaaz Ahmed on 11/05/2024.
//

import UIKit

class CustomTabBar: UIViewController {
    
    @IBOutlet weak var tabBarStackView: UIStackView!
    @IBOutlet weak var centerBtnBGview: UIView!
    @IBOutlet var tabBarButtons: [UIButton]!
    @IBOutlet var tabbarImages: [UIImageView]!
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var tabBar: UIView!
    
    var selectedImages = [
        "homeSelected",
        "ordersSelected",
        "newOrder",
        "notificationSelected",
        "userSelected"]
    
    var unselectedImages = [
        "homeUnSelected",
        "orderUnSelected",
        "newOrder",
        "notificationUnSelected",
        "userUnSelected"
    ]
    
    
    var myTabBarController: UITabBarController? = nil
    
    @IBOutlet weak var bubbleImgView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for btn in tabBarButtons {
            btn.tag = tabBarButtons.firstIndex(of: btn)!
        }
        
        for img in tabbarImages {
            img.tag = tabbarImages.firstIndex(of: img)!
        }
        
//        bubbleImgView.addTap {
//            print("center button clicked")
//            self.present(vc, animated: true)
//        }
//        
    }
    
    override func viewWillLayoutSubviews() {
        tabBar.roundCorners(corners: [.topLeft, .topRight], radius: 15)
        centerBtnBGview.layer.cornerRadius = centerBtnBGview.frame.height/2


    }
    
    @IBAction func tabBarChanged(_ sender: UIButton) {
        let tag = sender.tag
        
        for img in tabbarImages {
            img.image = UIImage(named: unselectedImages[img.tag])
        }
        
        tabbarImages[tag].image = UIImage(named: selectedImages[tag])
        
        myTabBarController?.selectedIndex = tag
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.destination is UITabBarController {
            self.myTabBarController = segue.destination as? UITabBarController
            self.myTabBarController?.tabBar.isHidden = true
        }
    }
    
}
