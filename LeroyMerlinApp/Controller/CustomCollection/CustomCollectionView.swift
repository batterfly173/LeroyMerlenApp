import UIKit
import Foundation

class CustomCollectionView: UICollectionView, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout
{
    init()
    {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        super.init(frame: .zero, collectionViewLayout: layout)
     
        delegate = self
        dataSource = self
        
        register(CellWithoutPrice.self, forCellWithReuseIdentifier: CellWithoutPrice.reuseID)
        
        register(CatalogCell.self, forCellWithReuseIdentifier: CatalogCell.reuseID)
        
        register(CellToAll.self, forCellWithReuseIdentifier: CellToAll.reuseID)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return CatalogArray().items.count + 2
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        return CGSize(width: 140, height: 140)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        if indexPath.row == 0
        {
            return dequeueReusableCell(withReuseIdentifier: CatalogCell.reuseID, for: indexPath)
        }
        else if indexPath.row == 6
        {
            return dequeueReusableCell(withReuseIdentifier: CellToAll.reuseID, for: indexPath)
        }
        else
        {
            let cell = dequeueReusableCell(withReuseIdentifier: CellWithoutPrice.reuseID, for: indexPath) as? CellWithoutPrice
            
            guard cell != nil else { return UICollectionViewCell()}
            
            cell?.label.text = CatalogArray().items[indexPath.row - 1].name
            cell?.imageView.image = CatalogArray().items[indexPath.row - 1].image
            
            return cell!
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
