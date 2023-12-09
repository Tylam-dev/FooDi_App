//
//  HomeController.swift
//  FooDi
//
//  Created by Tyrone Vera on 6/12/23.
//

import UIKit

class HomeController: UIViewController {
    
    @IBOutlet weak var feedTable: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        feedTable.dataSource = self
        feedTable.register(UINib(nibName: "FeedCell", bundle: nil), forCellReuseIdentifier: "FeedCell")
        // Do any additional setup after loading the view.
    }
    
    @IBAction func homeFeedButton() {
    }
    
    @IBAction func upLoadContentButton() {
    }
    @IBAction func profileButton() {
        performSegue(withIdentifier: "ProfileSegue", sender: nil)
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
extension HomeController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = feedTable.dequeueReusableCell(withIdentifier: "FeedCell", for: indexPath)
        return cell
    }
    
    
}
