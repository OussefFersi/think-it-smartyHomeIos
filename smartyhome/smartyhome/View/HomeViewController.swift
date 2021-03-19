//
//  HomeViewController.swift
//  smartyhome
//
//  Created by Oussef Fersi on 18/3/2021.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var homeWelcomeLabel: UILabel!
    @IBOutlet weak var currentDateLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    var data = [
        Room(name: "Living Room",numberOfDevices: 4,image: "livingroom"),
        Room(name: "Media Room",numberOfDevices: 6,image: "mediaroom"),
        Room(name: "Bathroom",numberOfDevices: 1,image: "bathroom"),
        Room(name: "Bedroom",numberOfDevices: 3,image: "bedroom")
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = MStyle.backgroundColor
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        self.tableView.register(UINib(nibName: "RoomTableViewCell", bundle: nil), forCellReuseIdentifier: RoomTableViewCell.identifier)
        
        
        let currentDate = Date()
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "en_EN")
        formatter.dateStyle = .long
        currentDateLabel?.text = formatter.string(from: currentDate)
        currentDateLabel?.textColor = MStyle.grayColor
        let userName =  UserDefaults.standard.string(forKey: MainViewController.USER_NAME_KEY) ?? "Unkown"//"Oussef"
        homeWelcomeLabel?.text = "Welcome, \(userName)!"
        homeWelcomeLabel?.textColor = MStyle.textColor
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension HomeViewController : UITableViewDelegate,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 160.0
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: RoomTableViewCell.identifier, for: indexPath) as? RoomTableViewCell{
            cell.roomViewModel = RoomViewModel(data[indexPath.row])
            return cell
        }
        
        return UITableViewCell()
    }
    
    
}

