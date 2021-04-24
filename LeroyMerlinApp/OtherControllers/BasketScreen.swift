import UIKit

class BasketController: UIViewController
{
    let label = UILabel()
    
    override func viewDidLoad()
    {
        view.addSubview(label)
        
        label.centerInSuperview()
        label.text = "Корзина пуста"
        label.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        label.font = UIFont(name: "HelveticaNeue-Bold", size: 20)
        
        self.view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    }
}
