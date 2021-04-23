import UIKit
import TinyConstraints

class myListController: UIViewController
{
    let label = UILabel()
    
    override func viewDidLoad()
    {
        view.addSubview(label)
        
        label.centerInSuperview()
        label.text = "Список пуст"
        label.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        label.font = UIFont(name: "HelveticaNeue-Bold", size: 20)
        
        self.view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    }
}

class shopsController: UIViewController
{
    let label = UILabel()
    
    override func viewDidLoad()
    {
        view.addSubview(label)
        
        label.centerInSuperview()
        label.text = "Поблизости нет магазинов"
        label.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        label.font = UIFont(name: "HelveticaNeue-Bold", size: 20)
        
        self.view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    }
}

class profileController: UIViewController
{
    let label = UILabel()
    
    override func viewDidLoad()
    {
        view.addSubview(label)
        
        label.centerInSuperview()
        label.text = "Профиль пуст"
        label.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        label.font = UIFont(name: "HelveticaNeue-Bold", size: 20)
        
        self.view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    }
}

class basketController: UIViewController
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


class TabBarController: UITabBarController {

    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        let vc = ContainerViewController()
        let vc1 = myListController()
        let vc2 = shopsController()
        let vc3 = profileController()
        let vc4 = basketController()
        
        vc.title = "Главная"
        vc1.title = "Мои список"
        vc2.title = "Магазины"
        vc3.title = "Профиль"
        vc4.title = "Корзина"
        
        self.tabBar.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        self.tabBar.tintColor = #colorLiteral(red: 0.3268811405, green: 0.7674738765, blue: 0.2489330173, alpha: 1)
        self.tabBar.unselectedItemTintColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        
        self.setViewControllers([vc, vc1, vc2, vc3, vc4], animated: false)
        self.modalPresentationStyle = .fullScreen
        
        
        guard let items = self.tabBar.items else { return }
        
        items[0].image = UIImage(systemName: "magnifyingglass")
        items[1].image = UIImage(systemName: "bookmark")
        items[2].image = UIImage(systemName: "map")
        items[3].image = UIImage(systemName: "person")
        items[4].image = UIImage(systemName: "cart")
    }
}
