import UIKit

@IBDesignable
class SearchButton: UIButton
{
    override func draw(_ rect: CGRect)
    {
        super.draw(rect)
        
        let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: [.topLeft, .topRight, .bottomLeft, .bottomRight], cornerRadii: CGSize(width: 4, height: 4))
        #colorLiteral(red: 0.2710745568, green: 0.8618734137, blue: 0.234674607, alpha: 1).setFill()
        path.fill()
    }
}
