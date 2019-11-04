import UIKit

class ListViewController: UIViewController {
    
    var tweets = [Tweet]()

    lazy var tableView: UITableView = {
        let table = UITableView(frame: view.bounds)
        table.rowHeight = UITableView.automaticDimension
        table.register(TweetCell.self, forCellReuseIdentifier: "TweetCell")
        
        table.delegate = self
        table.dataSource = self
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initializeView()
        
        TweetRepository.get(success: { (tweets) in
            self.tweets = tweets
            self.tableView.reloadData()
        })
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tableView.reloadData()
    }
    
    private func initializeView() {
        title = "List"
        view.addSubview(tableView)
    }
}

extension ListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tweets.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TweetCell", for: indexPath as IndexPath) as! TweetCell
        cell.tweet = tweets[indexPath.row]
        cell.followButton.tag = indexPath.row
        cell.followButton.addTarget(self, action: #selector(onFollow(sender:)), for: .touchUpInside)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    @objc func onFollow(sender: UIButton) {
        tweets[sender.tag].following = !tweets[sender.tag].following
        tableView.reloadData()
    }
}

extension ListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let viewController = DetailViewController(tweet: tweets[indexPath.row])
        navigationController?.pushViewController(viewController, animated: true)
    }
}

