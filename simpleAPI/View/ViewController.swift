//
//  ViewController.swift
//  simpleAPI
//
//  Created by odikk on 25/08/21.
//

import UIKit
import Alamofire
import SwiftyJSON

class ViewController: UIViewController {

    @IBOutlet weak var table: UITableView!
    var articleData: [Article]? = [Article]()
    var selectedData: Article?
    override func viewDidLoad() {
        super.viewDidLoad()
        getData()
        table.dataSource = self
        
    }
    
    private func getData(){
        let baseURL = "https://jsonplaceholder.typicode.com/posts"
        AF.request(baseURL, method: .get, encoding: JSONEncoding.default).responseJSON{ response in
            switch response.result{
            case .success(_ ):
                let data = JSON(response.data as Any)
//                for item in data.array{
//                    let articles = Article(json: JSON($0.object))
//                    self.articleData?.append(articles)
//                }
                if let results = data.array{
                    self.articleData?.append(contentsOf: results.map({Article(json: JSON($0.object))}))
                }
                DispatchQueue.main.async {
                    self.table.reloadData()
                }
            
            case .failure(let err):
                print(err)
            }
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == ""{
            let vc = segue.destination as? DetailViewController
            vc?.articleData = selectedData
        }
    }

}

extension ViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(articleData?.count)
        if articleData?.count ?? 0 > 0{
            return articleData!.count
        } else{
            return 0
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "main-cell") as! MainCell
        let data = articleData?[indexPath.row]
        if articleData!.count > 0 {
            if let item = data{
                cell.id.text = "\(String(describing: item.id))"
                cell.title.text = item.title
                cell.userID.text = "\(String(describing: item.userID))"

            }
        }
        self.selectedData = articleData?[indexPath.row]
        return cell
    }
}
