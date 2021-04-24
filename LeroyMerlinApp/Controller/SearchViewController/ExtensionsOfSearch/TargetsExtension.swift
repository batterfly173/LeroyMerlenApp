import Foundation
import UIKit

extension SearchViewController
{
    @objc func closeTextFieldButtonTapped()
    {
        searchTextField.resignFirstResponder()
        delegate.changeStateOfSearchBar(gesture: GestureForChangeStateOfSearchBar.closeTableViewButtonTapped)
    }
    
    @objc func textFieldButtonTapped()
    {
        leadingSpace.constant = 55
        searchTextField.updateConstraints()
        
        delegate.changeStateOfSearchBar(gesture: GestureForChangeStateOfSearchBar.textFieldButtonTapped)
    }

}
