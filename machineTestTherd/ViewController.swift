//
//  ViewController.swift
//  machineTestTherd
//
//  Created by Macintosh on 19/01/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var UserTableView: UITableView!
    var users : [User] = []
    var urlRequest : URLRequest?
    var jsonDecoder : JSONDecoder?
    var url : URL?
    private let userTableViewCellIdentifier = "UserTableViewCell"
    private let secondViewControllerIdentifier = "SecondViewController"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fatchDat()
        initializeUsertableView()
        registerXIBWithTableView()
    }
    func initializeUsertableView(){
        UserTableView.dataSource = self
        UserTableView.delegate = self
    }

    func registerXIBWithTableView(){
        let uiNib = UINib(nibName: userTableViewCellIdentifier , bundle: nil)
        self.UserTableView.register(uiNib, forCellReuseIdentifier: userTableViewCellIdentifier)
    }
    func fatchDat(){
        let url = URL(string: "https://fakestoreapi.com/users")
        var urlRequest = URLRequest(url: url!)
        var urlSession = URLSession(configuration: .default)
        var dataTask = URLSession.shared.dataTask(with: urlRequest) { data, Response, Error in
            self.users = try! JSONDecoder().decode([User].self, from: data!)
            
            print(self.users)
            DispatchQueue.main.async {
                self.UserTableView.reloadData()
            }
        }
        dataTask.resume()
    }

}

extension ViewController : UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        users.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let userTableViewCell = self.UserTableView.dequeueReusableCell(withIdentifier: "UserTableViewCell", for: indexPath) as! UserTableViewCell

        userTableViewCell.userNameLabel.text = String(users[indexPath.row].username)
        userTableViewCell.fristNameLabel.text = String(users[indexPath.row].name.firstname)
        userTableViewCell.lastnamelabel.text = String(users[indexPath.row].name.lastname)

        return userTableViewCell
    }


}


extension ViewController  : UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        200.0
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let secondViewController = self.storyboard?.instantiateViewController(withIdentifier: secondViewControllerIdentifier) as? SecondViewController

        secondViewController?.UserContainer = users[indexPath.row]
        self.navigationController?.pushViewController(secondViewController!, animated: true)
    }
}

