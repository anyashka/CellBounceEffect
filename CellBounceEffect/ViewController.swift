//
//  ViewController.swift
//  CellBounceEffect
//
//  Created by Anna-Maria Shkarlinska on 30/09/16.
//  Copyright © 2016 Anna-Maria Shkarlinska. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
    }
}

//MARK: Table View methods
extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    private func setupTableView() {
        let cellNib = UINib(nibName: TableViewCell.cellIdentifier, bundle: nil)
        tableView.registerNib(cellNib, forCellReuseIdentifier: TableViewCell.cellIdentifier)
        tableView.tableFooterView = UIView()
        tableView.rowHeight = 75
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(TableViewCell.cellIdentifier, forIndexPath: indexPath) as! TableViewCell
        return cell
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        guard let cell = tableView.cellForRowAtIndexPath(indexPath) as? TableViewCell else { return }
        cell.animateDeleteView()
    }
}

