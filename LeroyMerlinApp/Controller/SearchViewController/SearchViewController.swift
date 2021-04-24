import UIKit

class SearchViewController: UIViewController
{
    var searchTextField = UITextField()
    var label = UILabel()
    var lineShapeLayer = CAShapeLayer()
    var buttonTextField = CustomView()
    var closeTableViewButton = CustomView()
    
    var delegate: ChangePositionProtocol!
    
    var isFullShow = true
    
    var leadingSpace: NSLayoutConstraint!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.3268811405, green: 0.7674738765, blue: 0.2489330173, alpha: 1)
        
        configurateCloseTAbleViewButton()
        configurateTextFieldButton()
        configurateLine()
        configurateSearchTextField()
        configurateLabel()
    }
}


