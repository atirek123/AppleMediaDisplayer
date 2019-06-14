//
//  ViewController.swift
//  AppleMediaDisplayer
//
//  Created by Atirek Sharma on 14/06/19.
//  Copyright © 2019 Atirek Sharma. All rights reserved.
//

import UIKit
import RxSwift

class ViewController: UIViewController {
    
    //MARK: - Variables
    var screenSize:CGSize{
        return UIScreen.main.bounds.size
    }
    let navView = AnimatableView()
    let topTitleLabel = UILabel()
    let tableView = UITableView()
    let viewModel = MediaViewModel()
    let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        onViewDidLoad()
    }
    
    
}

//MARK: - Functions
extension ViewController {
    
    func onViewDidLoad() {
        createTitleView()
        addTitleLabel()
        addTableView()
        bindings()
        viewModel.getAppleMedia()
    }
    
    //MARK: - Create Title View
    func createTitleView() {
        
        navView.translatesAutoresizingMaskIntoConstraints = false
        navView.shadowOffset = CGSize(width: 0, height: 2.0)
        navView.shadowColor = UIColor.black.withAlphaComponent(0.22)
        navView.shadowOpacity = 1.0
        navView.shadowRadius = 1.0
        navView.backgroundColor = .white
        view.addSubview(navView)
        let topConstraint = NSLayoutConstraint(item: navView,
                                               attribute: .top,
                                               relatedBy: .equal,
                                               toItem: view ,
                                               attribute: .top,
                                               multiplier: 1,
                                               constant: 0 + UIApplication.shared.statusBarFrame.height)
        let leadingConstraint = NSLayoutConstraint(item: navView,
                                               attribute: .leading,
                                               relatedBy: .equal,
                                               toItem: view,
                                               attribute: .leading,
                                               multiplier: 1,
                                               constant: 0)
        let trailingConstraint = NSLayoutConstraint(item: navView,
                                                   attribute: .trailing,
                                                   relatedBy: .equal,
                                                   toItem: view,
                                                   attribute: .trailing,
                                                   multiplier: 1,
                                                   constant: 0)
        let heightConstraint = NSLayoutConstraint(item: navView,
                                                    attribute: .height,
                                                    relatedBy: .equal,
                                                    toItem: nil,
                                                    attribute: .notAnAttribute,
                                                    multiplier: 1,
                                                    constant: 44)
        view.addConstraints([topConstraint,leadingConstraint,trailingConstraint,heightConstraint])
    }
    
    //MARK: - Add Title Labe;
    func addTitleLabel() {
        
        topTitleLabel.text = "Apple Media Lists"
        topTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        topTitleLabel.font = UIFont.systemFont(ofSize: 20)
        topTitleLabel.textColor = UIColor.black.withAlphaComponent(70.0)
        navView.addSubview(topTitleLabel)
        
        /// adding constraint using NSLayoutConstraint
        let horizontalConstraint = NSLayoutConstraint(item: topTitleLabel,
                                                      attribute: .centerX,
                                                      relatedBy: .equal,
                                                      toItem: navView,
                                                      attribute: .centerX,
                                                      multiplier: 1.0,
                                                      constant: 0)
        let verticalConstraint = NSLayoutConstraint(item: topTitleLabel,
                                                      attribute: .centerY,
                                                      relatedBy: .equal,
                                                      toItem: navView,
                                                      attribute: .centerY,
                                                      multiplier: 1.0,
                                                      constant: 0)
        
        navView.addConstraints([horizontalConstraint,verticalConstraint])
    }
    
    func addTableView() {
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        let topConstraint = NSLayoutConstraint(item: tableView,
                                               attribute: .top,
                                               relatedBy: .equal,
                                               toItem: navView ,
                                               attribute: .bottom,
                                               multiplier: 1,
                                               constant: 0)
        let leadingConstraint = NSLayoutConstraint(item: tableView,
                                                   attribute: .leading,
                                                   relatedBy: .equal,
                                                   toItem: navView,
                                                   attribute: .leading,
                                                   multiplier: 1,
                                                   constant: 0)
        let trailingConstraint = NSLayoutConstraint(item: tableView,
                                                    attribute: .trailing,
                                                    relatedBy: .equal,
                                                    toItem: navView,
                                                    attribute: .trailing,
                                                    multiplier: 1,
                                                    constant: 0)
        let bottomConstraint = NSLayoutConstraint(item: tableView,
                                                  attribute: .bottom,
                                                  relatedBy: .equal,
                                                  toItem: view,
                                                  attribute: .bottom,
                                                  multiplier: 1,
                                                  constant: 0)
        view.addConstraints([topConstraint,leadingConstraint,trailingConstraint,bottomConstraint])
        view.sendSubviewToBack(tableView)
    }
    
    //MARK: - Bindings
    func bindings() {
        tableView.register(MediaTableViewCell.self, forCellReuseIdentifier: CellIdentifiers.mediaCell.identifier)
        tableView.register(MediaSectionTableViewCell.self, forCellReuseIdentifier: CellIdentifiers.medisSectionCell.identifier)
        tableView.rowHeight = UITableView.automaticDimension
        tableView.separatorStyle = .none
        tableView.contentInset = UIEdgeInsets(top: 8, left: 0, bottom: 16, right: 0)

        /// for sections
        viewModel.items.asObservable().bind(to: tableView.rx.items) { (tableView, index, model) -> UITableViewCell in
            
            let indexPath = IndexPath(row: index, section: 0)
            if model.isSection{
                guard let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifiers.medisSectionCell.identifier, for: indexPath ) as? MediaSectionTableViewCell else{
                    return UITableViewCell()
                }
                cell.mediaType = /model.mediaType?.type
                return cell
            }
            
            guard let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifiers.mediaCell.identifier, for: indexPath ) as? MediaTableViewCell else{
                return UITableViewCell()
            }
            cell.item = model
            return cell
        }<disposeBag
    }
}

