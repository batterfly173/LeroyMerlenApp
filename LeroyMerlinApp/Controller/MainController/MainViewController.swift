import UIKit

enum previousSwipes
{
    case up
    case down
}

protocol ChangePositionProtocol
{
    func changeStateOfSearchBar(gesture: GestureForChangeStateOfSearchBar)
}

class MainViewController: UIViewController
{
    var mainScrollView = UIScrollView(frame: UIScreen.main.bounds)
    var delegate: ChangePositionProtocol!
    
    var previousSwipe = previousSwipes.down
    var bestProductsTitle = UILabel()
    var limitedProductsProduct = UILabel()
    
    var searchTableView = UITableView()
    
    var catalogCollectionView: UICollectionView!
    var bestProductsCollectionView: UICollectionView!
    var limitedProductsCollectionView: UICollectionView!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        
        //MARK: Реализованно в extension
        
        configurateScrollView()
        configurateLabels()
        configurateTableView()
        
        configurateThirdCollectionView()
        configurateSecondCollectionView()
        configurateFirstCollectionView()
    }
}
