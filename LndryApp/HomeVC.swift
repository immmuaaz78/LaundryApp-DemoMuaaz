//
//  HomeVC.swift
//  LndryApp
//
//  Created by Muaaz Ahmed on 11/05/2024.
//

import UIKit

class HomeVC: UIViewController {

    @IBOutlet weak var bgImg: UIImageView!
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        initialSetUp()
    }

    func initialSetUp() {
        bgImg.roundCorners(corners: [.bottomLeft, .bottomRight], radius: 30.0)

        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(UINib(nibName: "HomeTableCell", bundle: nil),forCellReuseIdentifier: "HomeTableCell")
    }

}

extension HomeVC : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "HomeTableCell", for: indexPath) as! HomeTableCell
        
        let cellData = tableData[indexPath.row]
        if indexPath.row % 2 == 0 {
            cell.configureCell(info: cellData, color: UIColor(named: "lightBlue") ?? .blue)
        } else {
            
            cell.configureCell(info: cellData, color: UIColor(named: "darkBlue") ?? .blue)
        }
       
        
        return cell
    }
    
    
}
