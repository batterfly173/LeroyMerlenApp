import Foundation
import UIKit

extension MainViewController: UITableViewDelegate, UITableViewDataSource
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
        let det = DetailController()
        
        det.modalPresentationStyle = .fullScreen
        present(det, animated: false)
    }
    
}

