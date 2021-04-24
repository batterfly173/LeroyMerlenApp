import Foundation
import UIKit

extension MainViewController: UIScrollViewDelegate
{
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView)
    {
        guard scrollView == mainScrollView else { return }
        let translation = scrollView.panGestureRecognizer.translation(in: self.view)
        
        if translation.y < 0 && previousSwipe != .up
        {
            delegate.changeStateOfSearchBar(gesture: GestureForChangeStateOfSearchBar.swipeDown)
        }
        else if translation.y > 0 && previousSwipe != .down
        {
            delegate.changeStateOfSearchBar(gesture: GestureForChangeStateOfSearchBar.swipeUp)
        }
    }
}
