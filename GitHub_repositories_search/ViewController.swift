//
//  ViewController.swift
//  GitHub_repositories_search
//
//  Created by 石川諒 on 2017/05/19.
//  Copyright © 2017年 石川諒. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource,UISearchBarDelegate {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    var keyword = ""
    var request: GitHubAPIRouter?
    var items = [JSONDecodable]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //tableViewのデリゲートを設定
        self.tableView.delegate = self
        //tableViewのデーターソースを設定
        self.tableView.dataSource = self
        //searchBarのデリゲートを設定
        self.searchBar.delegate = self
        
        //セルの高さを自動調整する
        self.tableView.estimatedRowHeight = 100
        self.tableView.rowHeight = UITableViewAutomaticDimension
        // サイズと位置調整
        self.tableView.frame = CGRect(
            x: 0,
            y: -35, //先頭セルにある謎の隙間を埋めるため
            width: self.view.frame.width,
            height: self.view.frame.height - 35 //先頭セルにある謎の隙間を埋めるため
        )
        
        // カスタムセルクラス名でnibを作成する
        let nib = UINib(nibName: "RepositoryViewCell", bundle: nil)
        self.tableView.register(nib, forCellReuseIdentifier: "customCell")
    
    }
    
    //nibファイルをパラメタにとるイニシャライザinit
    //各カテゴリ用Viewのイニシャライザ
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        self.request = nil
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //cellの数を指定
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        //トータルカウントの数に応じたcell数を返す
        return self.items.count
    }
    
    //各行に表示するcellを定義
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        //cellの作成
        //let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cell")
        let cell = tableView.dequeueReusableCell(withIdentifier: "customCell", for: indexPath) as! RepositoryViewCell
        if let unwrappedRequest = self.request{
            switch unwrappedRequest {
            case .searchRepositories:
                let repository =
                    self.items[(indexPath as NSIndexPath).row] as! Repository
                cell.setCell(title: repository.name, discription: repository.description)
            }
        }
        return cell
    }

    //検索ボタンを押した時
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        if let searchWord = self.searchBar.text{
            self.keyword  = searchWord
        }
        //入力したkeywordよりリクエストの生成
        self.request = GitHubAPIRouter.searchRepositories(parameters: self.keyword)
        //APIを叩く
        self.search()
        self.searchBar.endEditing(true)
    }
    
    //検索の実行
    func search() -> Void {
        if let unwrappedRequest = self.request{
        Alamofire.request(unwrappedRequest).responseJSON { response in
            switch unwrappedRequest{
            //SearchRepositoriesの時
            case .searchRepositories:
                do{
                    let response =
                        try SearchResponse<Repository>(
                            json: response.result.value as? [String : Any] ?? "")
                    
                        let repositories = response
                        self.items = repositories.items as [Repository]
                        
                }catch{
                    print(error)
                }
            }
            //self.view.addSubview(self.tableView)
            self.tableView.reloadData()
        }
        }
    }

}

