import UIKit

enum previousSwipes
{
    case up
    case down
    case none
}

class ViewController: UIViewController
{
    @IBOutlet weak var greenPanel: UIView!
    @IBOutlet weak var mainScrollView: UIScrollView!
    fileprivate var pS = previousSwipes.none
    var label = UILabel()
    var label2 = UILabel()
    var bottomBar = BottomBar()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        mainScrollView.delegate = self
        
        mainScrollView.contentSize = CGSize(width: view.frame.width, height: 800)
        
        let test = CustomCollectionView()
        test.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        test.showsHorizontalScrollIndicator = false
        
        let test2 = SecondCustomCollectionView()
        test2.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        test2.showsHorizontalScrollIndicator = false
        
        let test3 = SecondCustomCollectionView()
        test3.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        test3.showsHorizontalScrollIndicator = false
        
        mainScrollView.addSubview(test)
        mainScrollView.addSubview(test2)
        mainScrollView.addSubview(test3)
        
        test.frame = CGRect(x: 10, y: 10, width: 395, height: 150)
        test2.frame = CGRect(x: 10, y: 210, width: 395, height: 190)
        test3.frame = CGRect(x: 10, y: 450, width: 395, height: 190)
        
        mainScrollView.addSubview(label)
        label.text = "Предложение ограничено"
        label.font = UIFont(name: "HelveticaNeue-Bold", size: 20)
        label.frame = CGRect(x: 10, y: 170, width: 400, height: 40)
        
        mainScrollView.addSubview(label2)
        label2.text = "Лучшая цена"
        label2.font = UIFont(name: "HelveticaNeue-Bold", size: 20)
        label2.frame = CGRect(x: 10, y: 410, width: 400, height: 40)
        
        mainScrollView.addSubview(bottomBar)
        bottomBar.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        bottomBar.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        bottomBar.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        bottomBar.heightAnchor.constraint(equalToConstant: 100).isActive = true
    }
}

extension ViewController: UIScrollViewDelegate
{
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView)
    {
        let translation = scrollView.panGestureRecognizer.translation(in: scrollView.self)
        
        if translation.y < 0 && pS != .down
        {
            UIView.animate(withDuration: 0.7, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options:         .curveEaseOut, animations: {
                self.greenPanel.frame.origin.y = self.greenPanel.frame.origin.y - 200
                self.mainScrollView.frame.origin.y = self.mainScrollView.frame.origin.y - 200
            }, completion: nil)
            pS = .down
        }
        else if translation.y > 0 && pS != .up
        {
            UIView.animate(withDuration: 0.7, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options:         .curveEaseOut, animations: {
                self.greenPanel.frame.origin.y = self.greenPanel.frame.origin.y + 200
                self.mainScrollView.frame.origin.y = self.mainScrollView.frame.origin.y + 200
            }, completion: nil)
            
            pS = .up
        }
    }
}
