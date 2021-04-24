import UIKit

class CustomView: UIView
{
    var imageView = UIImageView()
    
    init()
    {
        super.init(frame: .zero)
        
        self.addSubview(imageView)
        imageView.centerInSuperview()
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.widthAnchor.constraint(equalToConstant: 25).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 25).isActive = true
        imageView.contentMode = .scaleAspectFit
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
