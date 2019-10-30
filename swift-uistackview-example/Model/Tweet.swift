class Tweet {
    var id: Int
    var name: String
    var image: String
    var comment: String
    var following: Bool
    var created: String
    
    init(id: Int, name: String, image: String, comment: String, following: Bool,created: String) {
        self.id = id
        self.name = name
        self.image = image
        self.comment = comment
        self.following = following
        self.created = created
    }
}
