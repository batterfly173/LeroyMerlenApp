import Foundation
import UIKit


class CatalogCell: UICollectionViewCell
{
    static let reuseID = "CatalogCell"
    var label = UILabel()
    var imageView = UIImageView()
    
    override init(frame: CGRect)
    {
        super.init(frame: frame)
        self.backgroundColor = #colorLiteral(red: 0.3268811405, green: 0.7674738765, blue: 0.2489330173, alpha: 1)
        
        layer.cornerRadius = 7
        
        self.tintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        
        self.addSubview(label)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.frame = CGRect(x: 10, y: 0, width: 130, height: 60)
        label.font = UIFont(name: "HelveticaNeue-Medium", size: 17)
        label.text = "Каталог"
        label.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        
        self.addSubview(imageView)
        imageView.frame = CGRect(x: 90, y: 90, width: 35, height: 35)
        imageView.image = UIImage(systemName: "list.dash")
        imageView.contentMode = .scaleAspectFill
        
        self.layer.masksToBounds = true
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

