//
//  MovableViewDatasVC.swift
//  iOSTest
//
//  Created by Elhadad MALIDI on 18/01/2021.
//

import UIKit

class MovableViewDatasVC: UITableViewController {
    var datas: [MovableViewData] = []
    let adCellIdentifier = "AdCell"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        print(datas.count)
    }
    
    func configureTableView() {
        //set delegates
        setTableViewDelegates()

        //set row height
        tableView.rowHeight = 309

        // register cells
        tableView.register(MovableViewDataCell.self, forCellReuseIdentifier: adCellIdentifier)

    }

    private func setTableViewDelegates() {
        tableView.delegate = self
        tableView.dataSource = self
    }

}

extension MovableViewDatasVC {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datas.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: adCellIdentifier) as? MovableViewDataCell else {
            return UITableViewCell()
        }
        let data = datas[indexPath.row]
        cell.configure(with: data)
        return cell
    }

}
