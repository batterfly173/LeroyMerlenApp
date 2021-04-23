import UIKit
import Foundation

class SecondCustomCollectionView: UICollectionView, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout
{
    var array = [extendedItem]()
    init(identificator: Int)
    {
        if identificator == 0
        {
            array = BestArray().items
        }
        else
        {
            array = LimitedArray().items
        }
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        super.init(frame: .zero, collectionViewLayout: layout)
     
        delegate = self
        dataSource = self
        
        register(CellWithPrice.self, forCellWithReuseIdentifier: CellWithPrice.reuseID)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return array.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        return CGSize(width: 130, height: 190)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let cell = dequeueReusableCell(withReuseIdentifier: CellWithPrice.reuseID, for: indexPath) as? CellWithPrice
        
        guard cell != nil else { return UICollectionViewCell()}
        cell!.descriptionLabel.text = array[indexPath.row].description
        let str = NSString(format:"%.1f", array[indexPath.row].price!) as String
        cell!.priceLabel.text = str + " руб/ш"
        
        cell?.imageView.image = array[indexPath.row].image
        
        return cell!
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

