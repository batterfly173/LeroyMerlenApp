import UIKit

enum previousSwipes
{
    case up
    case down
}

protocol ChangePositionProtocol
{
    func changePosition(direction: Int)
}

class ViewController: UIViewController
{
    var mainScrollView = UIScrollView(frame: UIScreen.main.bounds)
    var delegate: ChangePositionProtocol!
    
    fileprivate var pS = previousSwipes.down
    var label = UILabel()
    var label2 = UILabel()
    
    var searchTableView = UITableView()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        
        view.addSubview(mainScrollView)
        mainScrollView.delegate = self
        mainScrollView.showsVerticalScrollIndicator = false
        mainScrollView.contentSize = CGSize(width: view.frame.width, height: 1000)
        
        let test = CustomCollectionView()
        test.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        test.showsHorizontalScrollIndicator = false
        
        let test2 = SecondCustomCollectionView(identificator: 0)
        test2.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        test2.showsHorizontalScrollIndicator = false
        
        let test3 = SecondCustomCollectionView(identificator: 1)
        test3.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        test3.showsHorizontalScrollIndicator = false
        
        mainScrollView.addSubview(test)
        mainScrollView.addSubview(test2)
        mainScrollView.addSubview(test3)
        
        test.frame = CGRect(x: 10, y: 10, width: 395, height: 150)
        test2.frame = CGRect(x: 10, y: 250, width: 395, height: 190)
        test3.frame = CGRect(x: 10, y: 550, width: 395, height: 190)
        
        mainScrollView.addSubview(label)
        label.text = "Предложение ограничено"
        label.font = UIFont(name: "HelveticaNeue-Bold", size: 22)
        label.frame = CGRect(x: 10, y: 200, width: 400, height: 40)
        
        mainScrollView.addSubview(label2)
        label2.text = "Лучшая цена"
        label2.font = UIFont(name: "HelveticaNeue-Bold", size: 22)
        label2.frame = CGRect(x: 10, y: 500, width: 400, height: 40)
        
        view.addSubview(searchTableView)
        
        searchTableView.delegate = self
        searchTableView.dataSource = self
        searchTableView.separatorStyle = .none
        searchTableView.showsVerticalScrollIndicator = false
        
        searchTableView.translatesAutoresizingMaskIntoConstraints = false
        searchTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        searchTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        searchTableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        searchTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -280).isActive = true
        searchTableView.isHidden = true
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource
{
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return PopularRequests().requests.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = UITableViewCell()
        cell.textLabel?.text = PopularRequests().requests[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}

extension ViewController: UIScrollViewDelegate
{
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView)
    {
        guard scrollView == mainScrollView else { return }
        let translation = scrollView.panGestureRecognizer.translation(in: self.view)
        
        if translation.y < 0 && pS != .up
        {
            delegate.changePosition(direction: 0)
            pS = .up
        }
        else if translation.y > 0 && pS != .down
        {
            delegate.changePosition(direction: 1)
            pS = .down
        }
    }
}