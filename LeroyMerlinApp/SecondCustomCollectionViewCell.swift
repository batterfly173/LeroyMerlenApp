import UIKit
import TinyConstraints

class SecondCustomCollectionViewCell: UICollectionViewCell
{
    static let reuseID = "SecondCustomCollectionViewCell"
    var label = UILabel()
    var imageView = UIImageView()
    var nameLabel = UILabel()
    
    override init(frame: CGRect)
    {
        super.init(frame: frame)
        self.backgroundColor = #colorLiteral(red: 0.9715135854, green: 0.9715135854, blue: 0.9715135854, alpha: 1)
        
        layer.cornerRadius = 7
        
        self.addSubview(imageView)
        imageView.centerXToSuperview()
        imageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 0).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        imageView.image = UIImage(named: "drel")
        imageView.contentMode = .scaleAspectFit
        
        self.addSubview(label)
        label.centerXToSuperview()
        label.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 10).isActive = true
        label.font = UIFont(name: "HelveticaNeue-Bold", size: 20)
        label.text = "120.23 руб"
        
        self.addSubview(nameLabel)
        nameLabel.centerXToSuperview()
        nameLabel.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 7).isActive = true
        nameLabel.widthAnchor.constraint(equalToConstant: 120).isActive = true
        nameLabel.font = UIFont(name: "HelveticaNeue", size: 15)
        nameLabel.text = "Дрель обычная перворатор арарв врвп"
        nameLabel.numberOfLines = 2
        
        self.layer.masksToBounds = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
