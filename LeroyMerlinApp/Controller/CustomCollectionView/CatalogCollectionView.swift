import UIKit
import Foundation

class CatalogCollectionView: UICollectionView, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout
{
    init()
    {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        super.init(frame: .zero, collectionViewLayout: layout)
     
        delegate = self
        dataSource = self
        
        register(CellWithGroup.self, forCellWithReuseIdentifier: CellWithGroup.reuseID)
        
        register(CatalogCell.self, forCellWithReuseIdentifier: CatalogCell.reuseID)
        
        register(CellToAll.self, forCellWithReuseIdentifier: CellToAll.reuseID)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return CatalogArray.itemsForCatalog.count + 2
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
        else if indexPath.row == CatalogArray.itemsForCatalog.count + 1
        {
            return dequeueReusableCell(withReuseIdentifier: CellToAll.reuseID, for: indexPath)
        }
        else
        {
            let cell = dequeueReusableCell(withReuseIdentifier: CellWithGroup.reuseID, for: indexPath) as? CellWithGroup
            
            guard let collectionCell = cell else { return UICollectionViewCell()}
            
            collectionCell.label.text = CatalogArray.itemsForCatalog[indexPath.row - 1].name
            collectionCell.imageView.image = CatalogArray.itemsForCatalog[indexPath.row - 1].image
            
            return collectionCell
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
