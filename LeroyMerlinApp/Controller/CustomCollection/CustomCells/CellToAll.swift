import Foundation
import UIKit


class CellToAll: UICollectionViewCell
{
    static let reuseID = "CellToAll"
    var label = UILabel()
    var imageView = UIImageView()
    
    override init(frame: CGRect)
    {
        super.init(frame: frame)
        self.backgroundColor = #colorLiteral(red: 0.9715135854, green: 0.9715135854, blue: 0.9715135854, alpha: 1)
        
        layer.cornerRadius = 7
        
        self.tintColor = #colorLiteral(red: 0.3268811405, green: 0.7674738765, blue: 0.2489330173, alpha: 1)
        
        self.addSubview(label)
        label.frame = CGRect(x: 10, y: 80, width: 130, height: 40)
        label.font = UIFont(name: "HelveticaNeue-Medium", size: 17)
        label.text = "Смотреть все"
        label.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        self.addSubview(imageView)
        imageView.frame = CGRect(x: 40, y: 35, width: 50, height: 50)
        imageView.image = UIImage(systemName: "chevron.right.circle.fill")
        imageView.contentMode = .scaleAspectFill
        
        self.layer.masksToBounds = true
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
