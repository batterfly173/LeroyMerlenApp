import UIKit
import TinyConstraints

class TabBarController: UITabBarController {

    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        let vc1 = ContainerViewController()
        let vc2 = MyListController()
        let vc3 = ShopsController()
        let vc4 = ProfileController()
        let vc5 = BasketController()
        
        vc1.title = "Главная"
        vc2.title = "Мои список"
        vc3.title = "Магазины"
        vc4.title = "Профиль"
        vc5.title = "Корзина"
        
        self.tabBar.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        self.tabBar.tintColor = #colorLiteral(red: 0.3268811405, green: 0.7674738765, blue: 0.2489330173, alpha: 1)
        self.tabBar.unselectedItemTintColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        
        self.setViewControllers([vc1, vc2, vc3, vc4, vc5], animated: false)
        self.modalPresentationStyle = .fullScreen
        
        
        guard let items = self.tabBar.items else { return }
        
        items[0].image = UIImage(systemName: "magnifyingglass")
        items[1].image = UIImage(systemName: "bookmark")
        items[2].image = UIImage(systemName: "map")
        items[3].image = UIImage(systemName: "person")
        items[4].image = UIImage(systemName: "cart")
    }
}
