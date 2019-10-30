import Foundation

class TweetRepository {
    
    public static func get(success: @escaping([Tweet])->()) -> Void {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            var tweets = [Tweet]()
            for i in 1..<20 {
                tweets.append(Tweet(
                    id: i,
                    name: "user\(i)",
                    image: "user\(i).png",
                    comment: "コメントコメントコメントコメントコメントコメントコメントコメントコメントコメントコメントコメントコメントコメントコメントコメント",
                    following: i % 2 == 0,
                    created: "2019-10-24 10:55"
                ))
            }
            success(tweets)
        }
    }
}
