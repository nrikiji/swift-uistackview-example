import UIKit

class FollowButton: UIButton {
    
    var tweet: Tweet? {
        didSet {
            let title = tweet?.following ?? true ? "Unfollow" : "Follow"
            setTitle(title, for: .normal)
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setTitleColor(.gray, for: .normal)
        titleLabel?.font = .boldSystemFont(ofSize: 14)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
