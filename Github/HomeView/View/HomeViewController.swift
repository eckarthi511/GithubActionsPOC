//
//  HomeViewController.swift
//  Github
//
//  Created by Karthick R on 4/11/21.
//

import UIKit

class HomeViewController: UIViewController {
    
    //MARK: IBOutlets
    @IBOutlet weak var homeTableView: UITableView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    //MARK: Presenter
    var presenter: HomeViewPresenterProtocol?

    override func viewDidLoad() {
        // Do any additional setup after loading the view.
        super.viewDidLoad()
        self.navigationItem.title = Nav_Title
        setupTableView()
        callApi()
    }
    
    // Create TableView
    func setupTableView() {
        homeTableView.register(UINib(nibName: "HomeViewTVCell", bundle: Bundle.main), forCellReuseIdentifier: "HomeTVCIdentifier")
        homeTableView.dataSource = self
        homeTableView.rowHeight = UITableView.automaticDimension
        homeTableView.bounces = false
        homeTableView.separatorStyle = .none
    }
    
    // Call Api
    func callApi() {
        activityIndicator.showActivityIndicator(true)
        presenter?.callGithubApi { [weak self](result, strError) in
            DispatchQueue.main.async { [weak self] in
                self?.activityIndicator?.showActivityIndicator(false)
                if result {
                    self?.homeTableView.reloadData()
                }
                else {
                    self?.showAlert(strError)
                }
            }
        }
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

//MARK: TableView Datasource
extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.objHomeViewDisplayEntityArray?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let tempHomeViewTVC = tableView.dequeueReusableCell(withIdentifier: "HomeTVCIdentifier", for: indexPath) as? HomeViewTVCell,
              let tempHomeViewDisplayEntity = presenter?.objHomeViewDisplayEntityArray?[indexPath.row] else {
            return UITableViewCell()
        }
        tempHomeViewTVC.loadTVCCell(tempHomeViewDisplayEntity)
        return tempHomeViewTVC
    }
}
