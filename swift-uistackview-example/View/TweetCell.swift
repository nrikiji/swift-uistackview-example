import UIKit

class TweetCell: UITableViewCell {
    
    var tweet: Tweet? {
        didSet {
            guard let _tweet = tweet else { return }
            
            nameLabel.text = _tweet.name
            commentLabel.text = _tweet.comment
            createdLabel.text = _tweet.created
            followButton.tweet = _tweet
            iconImage.image = UIImage(named: _tweet.image)
        }
    }
    
    lazy var mainStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.distribution = .equalSpacing
        stack.alignment = .top
        
        stack.addArrangedSubview(iconImage)
        stack.addArrangedSubview(rightAreaStack)
        
        return stack
    }()

    lazy var rightAreaStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.distribution = .fill
        stack.alignment = .leading
        stack.spacing = 5
        
        stack.addArrangedSubview(nameLabel)
        stack.addArrangedSubview(commentLabel)
        stack.addArrangedSubview(followButtonView)
        stack.addArrangedSubview(createdLabel)

        return stack
    }()
    
    lazy var iconImage: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()

    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .boldSystemFont(ofSize: 18)
        return label
    }()
    
    lazy var commentLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .systemFont(ofSize: 14)
        label.numberOfLines = 3
        return label
    }()
    
    lazy var followButton: FollowButton = {
        let button = FollowButton()
        return button
    }()
    
    lazy var followButtonView: UIView = {
        let view = UIView()
        view.addSubview(followButton)
        return view
    }()
    
    lazy var createdLabel: UILabel = {
        let label = UILabel()
        label.textColor = .gray
        label.font = .systemFont(ofSize: 14)
        label.textAlignment = .right
        return label
    }()
    

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        // Overall margin
        addSubview(mainStack)
        
        mainStack.translatesAutoresizingMaskIntoConstraints = false
        iconImage.translatesAutoresizingMaskIntoConstraints = false
        followButtonView.translatesAutoresizingMaskIntoConstraints = false
        followButton.translatesAutoresizingMaskIntoConstraints = false
        createdLabel.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            // Overall margin
            mainStack.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            mainStack.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            mainStack.leftAnchor.constraint(equalTo: leftAnchor, constant: 10),
            mainStack.rightAnchor.constraint(equalTo: rightAnchor, constant: -10),
            // Icon size
            iconImage.widthAnchor.constraint(equalToConstant: 60),
            iconImage.heightAnchor.constraint(equalToConstant: 60),
            // Follow button is right
            followButtonView.widthAnchor.constraint(equalTo: rightAreaStack.widthAnchor),
            followButton.rightAnchor.constraint(equalTo: followButtonView.rightAnchor),
            followButton.topAnchor.constraint(equalTo: followButtonView.topAnchor),
            followButton.bottomAnchor.constraint(equalTo: followButtonView.bottomAnchor),
            // Posting date is right
            createdLabel.rightAnchor.constraint(equalTo: rightAreaStack.rightAnchor, constant: 0),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
