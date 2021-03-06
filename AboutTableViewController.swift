//
//  AboutTableViewController.swift
//  100Flavor
//
//  Created by 姚宇鴻 on 2017/4/4.
//  Copyright © 2017年 JordanYao. All rights reserved.
//

import UIKit
import SafariServices

class AboutTableViewController: UITableViewController {

    
    var sectionTitles = ["給我們意見", "追蹤我們"]
    var sectionContent = [["在App Store上評分"], ["Instagram", "Facebook粉絲專頁", "Blog"]]
    var links = ["https://www.instagram.com/100tastesintw2015/", "https://www.facebook.com/100tastesintw/", "https://100tastesintaiwan.wixsite.com/100tastesintw"]

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /*移除多餘的格線*/
        tableView.tableFooterView = UIView(frame: CGRect.zero)
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return sectionTitles.count//兩個區塊的tableview，其實可以直接寫return 2
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sectionContent[section].count
    }

    /*呈現區塊的標題，回傳相對應的標題給指定區塊*/
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionTitles[section]
    }
    /*設定文字標籤並回傳cell*/
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        cell.textLabel?.text = sectionContent[indexPath.section][indexPath.row]
        
        return cell
        
    }
    
    
    // MARK: - Table view delegate
    //呼叫網頁
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.section {
        case 0://打開safari的方法
            if indexPath.row == 0 {
                if let url = URL(string: "https://www.apple.com/tw/itunes/charts/free-apps/"){
                    UIApplication.shared.open(url)
                }
            }
        case 1://直接打開內嵌safari
            if let url = URL(string: links[indexPath.row]){
                let safariController = SFSafariViewController(url: url)
                present(safariController, animated:  true, completion: nil)
            }
        default:
            break
        }
        
        tableView.deselectRow(at: indexPath, animated: false)
        
    }

    
    
    
    
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
