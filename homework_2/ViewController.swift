
import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var numberTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var signButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    private let correctPassword = "123"
    
    @IBAction func signButtonDidTap(_ sender: Any) {
        
        let number = numberTextField.text
        let password = passwordTextField.text
        
        let range = NSRange(location: 0, length: (number?.utf16.count)!)
        let regex = try! NSRegularExpression(pattern: "8908[0-9]{7}")
        let viewController = UIViewController()
        if (regex.firstMatch(in: number!, options: [], range: range) != nil) && (password == correctPassword) {
            guard let vc = storyboard?.instantiateViewController(identifier: "NewViewController") else { return }
            navigationController?.pushViewController(vc, animated: true)
            
        } else {
            present(viewController, animated: true)
            viewController.view.backgroundColor = UIColor.red
        }
    }
}

class NewViewController: UIViewController, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    private let data: [ListTableViewData] = [
        ListTableViewData(title: "Adelya"),
        ListTableViewData(title: "Anya"),
        ListTableViewData(title: "Alina"),
        ListTableViewData(title: "Dasha"),
        ListTableViewData(title: "Vika"),
        ListTableViewData(title: "Vera"),
        ListTableViewData(title: "Natasha"),
        ListTableViewData(title: "Masha"),
        ListTableViewData(title: "Katya"),
        ListTableViewData(title: "Ivan"),
        ListTableViewData(title: "Petya"),
        ListTableViewData(title: "Dima")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        100
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ListTableViewCell") as? ListTableViewCell else { return UITableViewCell()}
        cell.setUp(data[indexPath.row])
        return cell
    }
}


