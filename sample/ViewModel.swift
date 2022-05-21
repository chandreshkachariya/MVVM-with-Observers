//
//  ViewModel.swift
//  sample
//
//  Created by Chandresh Kachariya on 10/10/21.
//

import UIKit

class ViewModel: NSObject {

    weak var dataSource : GenericDataSource<MoreItem>?

    init(dataSource : GenericDataSource<MoreItem>?) {
        self.dataSource = dataSource
    }
    
    func getMoreItems(){
        let moreItems = [
            MoreItem(title: "Account", image: ""),
            MoreItem(title: "settings", image: ""),
            MoreItem(title: "Help", image: ""),
            MoreItem(title: "Report a Problem" , image: ""),
            MoreItem(title: "Share", image: ""),
            MoreItem(title: "Store", image: ""),
            MoreItem(title: "Logout", image: ""),
        ]
        dataSource?.data.value = moreItems
    }
}

class MoreDataSource : GenericDataSource<MoreItem>, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.value.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") else {
                return UITableViewCell(style: .default, reuseIdentifier: "cell")
            }
            return cell
        }()
    
        
        let moreItem = data.value[indexPath.row]
    
        cell.imageView?.image = UIImage(named: moreItem.image)
        cell.textLabel?.text = moreItem.title
        
        return cell
    }
  
}
