import Foundation
import UIKit

struct item
{
    var name: String?
    var image: UIImage?
}

class CatalogArray
{
   static var itemsForCatalog = [item(name: "Сад", image: UIImage(named: "flower")),
                              item(name: "Освещение", image: UIImage(named: "lustra")),
                              item(name: "Инструменты", image: UIImage(named: "drel")),
                              item(name: "Стройматериалы", image: UIImage(named: "kirpich")),
                              item(name: "Декор", image: UIImage(named: "oboi"))]
}
