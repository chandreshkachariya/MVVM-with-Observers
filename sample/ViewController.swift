//
//  ViewController.swift
//  sample
//
//  Created by Chandresh Kachariya on 10/10/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    let dataSource = MoreDataSource()
    lazy var viewModel : ViewModel = {
        let viewModel = ViewModel(dataSource: dataSource)
        return viewModel
    }()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.setupTableView()
    }


    //MARK:- Table View
    func setupTableView (){
        self.tableView.dataSource = self.dataSource
        self.tableView.delegate = self
        self.dataSource.data.addAndNotify(observer: self) { [weak self] _ in
            guard let `self` = self else { return }
            self.tableView.reloadData()
        }
        viewModel.getMoreItems()
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if let item = self.viewModel.dataSource?.data.value[indexPath.row] {
            debugPrint(item.title)
        }
    }
}
