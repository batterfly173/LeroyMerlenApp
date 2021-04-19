import UIKit
import TinyConstraints

class ViewForButtons: UIView
{
    var button = UIButton()
    var label = UILabel()
    
    init(imageName: String, text: String)
    {
        super.init(frame: .zero)
        
        self.addSubview(button)
        button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0)
        button.centerXToSuperview()
        button.topAnchor.constraint(equalTo: self.topAnchor, constant: 0).isActive = true
        button.widthAnchor.constraint(equalToConstant: 30).isActive = true
        button.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        button.addTarget(self, action: #selector(tapped), for: .touchUpInside)
        button.tag = 1
        button.setImage(UIImage(named: imageName), for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        
        self.addSubview(label)
        label.centerXToSuperview()
        label.topAnchor.constraint(equalTo: button.bottomAnchor, constant: 5).isActive = true
        label.font = UIFont(name: "HelveticaNeue-Bold", size: 10)
        label.textColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        label.text = text
    }
    
    @objc func tapped(sender: UIButton)
    {
        print(sender.tag)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
