import Foundation
import UIKit


class CustomCollectionViewCell: UICollectionViewCell
{
    static let reuseID = "CustomCollectionViewCell"
    var label = UILabel()
    var imageView = UIImageView()
    
    override init(frame: CGRect)
    {
        super.init(frame: frame)
        self.backgroundColor = #colorLiteral(red: 0.9715135854, green: 0.9715135854, blue: 0.9715135854, alpha: 1)
        
        layer.cornerRadius = 7
        
        self.addSubview(label)
        label.frame = CGRect(x: 10, y: 10, width: 110, height: 40)
        label.font = UIFont(name: "HelveticaNeue-Bold", size: 15)
        label.text = "Стройматериалы"
        label.numberOfLines = 2
        
        self.addSubview(imageView)
        imageView.frame = CGRect(x: 50, y: 50, width: 95, height: 95)
        imageView.image = UIImage(named: "drel")
        imageView.contentMode = .scaleAspectFill
        
        self.layer.masksToBounds = true
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
