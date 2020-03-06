//
//  ViewController.swift
//  BBCitySearch
//
//  Created by Shubham Sharma on 02/03/2020.
//  Copyright © 2020 Shubham Sharma. All rights reserved.
//

import UIKit

class SearchCityViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    fileprivate var presenter:SearchCityPresentable?
    fileprivate var cities: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = SearchCityPresenter.init()
        title = "Search your City"
        
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        tableView.delegate = self
        tableView.dataSource = self
        searchBar.delegate = self
    }
    
}

extension SearchCityViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cities.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier = "searchResultCell"
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier) ??
            UITableViewCell.init(style: UITableViewCell.CellStyle.subtitle, reuseIdentifier: identifier)
        cell.cellWithCityData(cityName: cities[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        if let mapView = storyBoard.instantiateViewController(withIdentifier: "MapViewController") as? MapViewController{
           
            mapView.setupMapView(cityName: cities[indexPath.row])
           // mapView.city = tableView.cellForRow(at: indexPath)
            self.navigationController?.pushViewController(mapView, animated: true)
        }
        
    }
}

extension SearchCityViewController: UISearchBarDelegate{
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if (searchText.count > 0){
            
            presenter?.getCitiesWithPrefix(searchString:searchText, completionBlock: { [weak self] status,data in
                if let cityArray  = data as? [String]{
                    self?.cities = cityArray
                    self?.tableView.reloadData()
                }
            } )
        }
        else{
            self.cities = []
            self.tableView.reloadData()
        }
    }
}

