import UIKit

class DetailController: UIViewController
{
    let label = UILabel()
    let button = UIButton()
    
    override func viewDidLoad()
    {
        view.addSubview(label)
        
        label.centerInSuperview()
        label.text = "Тут ничего нет"
        label.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        label.font = UIFont(name: "HelveticaNeue-Bold", size: 20)
        
        view.addSubview(button)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        button.topAnchor.constraint(equalTo: view.topAnchor, constant: 50).isActive = true
        button.widthAnchor.constraint(equalToConstant: 30).isActive = true
        button.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        button.setImage(UIImage(systemName: "chevron.left"), for: .normal)
        button.tintColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        button.addTarget(self, action: #selector(tap), for: .touchUpInside)
        
        self.view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    }
    
    @objc func tap()
    {
        let test = UIStoryboard(name: "Main", bundle: nil).instantiateInitialViewController() as! TabBarController
        
        test.modalPresentationStyle = .fullScreen
        present(test, animated: false)
    }
}

