import UIKit

class BottomBar: UIView
{
    init()
    {
        super.init(frame: .zero)
        
        backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        translatesAutoresizingMaskIntoConstraints = false
        layer.borderWidth = 2
        layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        
        let firstView = ViewForButtons(imageName: "loup2", text: "Главная")
        self.addSubview(firstView)
        firstView.frame = CGRect(x: 20, y: 15, width: 30, height: 50)
        
        let secondView = ViewForButtons(imageName: "test", text: "Мои список")
        self.addSubview(secondView)
        secondView.frame = CGRect(x: 100, y: 15, width: 30, height: 30)
        
        let thirdView = ViewForButtons(imageName: "shop", text: "Магазины")
        self.addSubview(thirdView)
        thirdView.frame = CGRect(x: 180, y: 15, width: 30, height: 30)
        
        let fourthView = ViewForButtons(imageName: "man", text: "Профиль")
        self.addSubview(fourthView)
        fourthView.frame = CGRect(x: 260, y: 15, width: 30, height: 30)
        
        let fifthView = ViewForButtons(imageName: "telega", text: "Корзина")
        self.addSubview(fifthView)
        fifthView.frame = CGRect(x: 340, y: 15, width: 30, height: 30)
    }
    
    @objc func tapped(sender: UIButton)
    {
        print(sender.tag)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
