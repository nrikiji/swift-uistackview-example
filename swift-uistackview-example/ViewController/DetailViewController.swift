import UIKit

class DetailViewController: UIViewController {
    
    var tweet: Tweet
    
    init(tweet: Tweet) {
        self.tweet = tweet
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    lazy var scrollView: UIScrollView = {
        let scroll = UIScrollView()
        scroll.addSubview(mainStack)
        return scroll
    }()
    
    lazy var mainStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.distribution = .fill
        stack.alignment = .center
        stack.spacing = 10
        
        stack.addArrangedSubview(iconImage)
        stack.addArrangedSubview(nameLabel)
        stack.addArrangedSubview(commentLabel)
        return stack
    }()
    
    lazy var iconImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: tweet.image)
        return imageView
    }()
    
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .boldSystemFont(ofSize: 20)
        label.numberOfLines = 0
        label.text = tweet.name
        return label
    }()
    
    lazy var commentLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .systemFont(ofSize: 20)
        label.numberOfLines = 0
        label.text = tweet.comment
        return label
    }()
    
    lazy var followButton: FollowButton2 = {
        let button = FollowButton2()
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        initializeView()
    }
    
    private func initializeView() {
        title = "Detail"
        view.backgroundColor = .white
        
        view.addSubview(scrollView)
        view.addSubview(followButton)

        scrollView.translatesAutoresizingMaskIntoConstraints = false
        mainStack.translatesAutoresizingMaskIntoConstraints = false
        iconImage.translatesAutoresizingMaskIntoConstraints = false
        commentLabel.translatesAutoresizingMaskIntoConstraints = false
        followButton.translatesAutoresizingMaskIntoConstraints = false

        // first view in mainStack margin top
        mainStack.layoutMargins = UIEdgeInsets(top: 10, left: 0, bottom: 0, right: 0)
        mainStack.isLayoutMarginsRelativeArrangement = true

        NSLayoutConstraint.activate([
            // ScrollView fills the screen
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
            scrollView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0),
            scrollView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0),
            // StackView full of ScrollView
            mainStack.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 0),
            mainStack.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: 0),
            mainStack.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 0),
            mainStack.rightAnchor.constraint(equalTo: scrollView.rightAnchor, constant: 0),
            mainStack.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            // Icon size and top margin
            iconImage.widthAnchor.constraint(equalToConstant: 150),
            iconImage.heightAnchor.constraint(equalToConstant: 150),
            // Comment margin
            commentLabel.leftAnchor.constraint(equalTo: mainStack.leftAnchor, constant: 10),
            // Fixed follow button at the bottom of the screen
            followButton.widthAnchor.constraint(equalTo: view.widthAnchor),
            followButton.heightAnchor.constraint(equalToConstant: 80),
            followButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
        ])
        
        followButton.addTarget(self, action: #selector(onFollow(sender:)), for: .touchUpInside)
        followButton.tweet = self.tweet
    }
    
    @objc func onFollow(sender: UIButton) {
        tweet.following = !tweet.following
        followButton.tweet = tweet
    }
}
