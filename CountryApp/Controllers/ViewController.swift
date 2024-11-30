//
//  ViewController.swift
//  CountryApp
//
//  Created by Siddharth Dave on 25/08/23.
//

import UIKit
import SDWebImage

class ViewController: UIViewController {
    
    @IBOutlet weak var TableView: UITableView!
    
    var apiData:[CountryName] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    
        
        self.registerTableView()
        self.getNEWData()
    }
    
    
    func getNEWData() {
        
        ApiHelper.sharedInstance.CountrysInfo { [weak self] data in
            guard let self else { return }
            self.apiData = data
            DispatchQueue.main.async {
                self.TableView.reloadData()
            }
        }
    }
    
    func registerTableView() {
        
        self.TableView.dataSource = self
        self.TableView.delegate = self
        self.TableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "TableViewCell")
        self.TableView.rowHeight = UITableView.automaticDimension
    }

}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return apiData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = TableView.dequeueReusableCell(withIdentifier: "TableViewCell") as? TableViewCell else {
            return UITableViewCell()
        }
        
        cell.countryName.text = apiData[indexPath.row].name.common
        
        let image = URL(string: apiData[indexPath.row].flags.png ?? "" )
//        print(image as Any)
        cell.flagimage.sd_setImage(with: image)
        cell.flagimage.layer.cornerRadius = 40
        
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            apiData.remove(at: indexPath.row)
            self.TableView.reloadData()
        }
    }
   
    
    
}
