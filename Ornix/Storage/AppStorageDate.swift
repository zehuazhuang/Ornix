

import Foundation
import SwiftUI


final class AppStorageManager {

    static let shared = AppStorageManager()

    private init() {}

    
    private let usersKey = "opulentUsers"
    private let focalizingPost = "focalizingPost"
    private let commentsKey = "eclectiComments"
    private let discoverPostKey = "discoverPosts"
    private let layeringCommentsKey = "layeringComments"
    private let collecleMessageKey = "collecleMessages"
    private let waistchainInfoKey = "waistchainInfos"
    private let storage = UserDefaults.standard
    
    func initializeAllDefaults() {
        initializeDefaultUsers()
        initializeDefaultArticles()
        initializeDefaultDiscoverPosts()
        initializeDefaultCollecleMessages()
        initializeDefaultWaistchainInfos()
    }

    func initializeDefaultUsers() {
        if storage.data(forKey: usersKey) != nil { return }

        let defaultUsers: [PolishedUser] = [
            PolishedUser(
                refinedUid: 1,
                elegantName: "Klein",
                accentingCoin: 11600,
                pairingAvatar: "iuasdwqu1",
                anchoringEmail: "klein@gmail.com",
                crystalsPassword: "123456",
                platinumBlock: [],
                centeringFollow: [5],
                stylingFans: [2]
            ),
            PolishedUser(
                refinedUid: 2,
                elegantName: "Murray",
                accentingCoin: 0,
                pairingAvatar: "iuasdwqu2",
                anchoringEmail: "",
                crystalsPassword: "",
                platinumBlock: [],
                centeringFollow: [1],
                stylingFans: []
            ),
            PolishedUser(
                refinedUid: 3,
                elegantName: "Dennis",
                accentingCoin: 0,
                pairingAvatar: "iuasdwqu3",
                anchoringEmail: "",
                crystalsPassword: "",
                platinumBlock: [],
                centeringFollow: [],
                stylingFans: []
            ),
            PolishedUser(
                refinedUid: 4,
                elegantName: "Vera",
                accentingCoin: 0,
                pairingAvatar: "iuasdwqu4",
                anchoringEmail: "",
                crystalsPassword: "",
                platinumBlock: [],
                centeringFollow: [],
                stylingFans: []
            ),
            PolishedUser(
                refinedUid: 5,
                elegantName: "Annie",
                accentingCoin: 0,
                pairingAvatar: "iuasdwqu5",
                anchoringEmail: "",
                crystalsPassword: "",
                platinumBlock: [],
                centeringFollow: [],
                stylingFans: [1]
            ),
            PolishedUser(
                refinedUid: 6,
                elegantName: "Sylvia",
                accentingCoin: 0,
                pairingAvatar: "iuasdwqu6",
                anchoringEmail: "",
                crystalsPassword: "",
                platinumBlock: [],
                centeringFollow: [],
                stylingFans: []
            ),
            
        ]

        if let data = try? JSONEncoder().encode(defaultUsers) {
            storage.set(data, forKey: usersKey)
        }
    }
    
    func getBlockedUsers() -> [PolishedUser] {
            let currentUid = getCurrentUserId()
            let users = getUsers()
            
            guard let loginUser = users.first(where: { $0.refinedUid == currentUid }) else {
                return []
            }
            
            let blockedUsers = loginUser.platinumBlock
            return users.filter { blockedUsers.contains($0.refinedUid) }
        }
    
    func toggleBlockUser(targetUid: Int) {
            let currentUid = getCurrentUserId()
            guard currentUid != -1, currentUid != targetUid else { return }

            var users = getUsers()
            guard let currentIndex = users.firstIndex(where: { $0.refinedUid == currentUid }) else { return }

            var currentUser = users[currentIndex]

            if currentUser.platinumBlock.contains(targetUid) {
                currentUser.platinumBlock.removeAll { $0 == targetUid }
            } else {
                currentUser.platinumBlock.append(targetUid)
            }

            users[currentIndex] = currentUser
            saveUsers(users)
        }
    
    func updateUser(uid: Int, update: (PolishedUser) -> PolishedUser) {
         var users = getUsers()
         
         // 找到索引
         guard let index = users.firstIndex(where: { $0.refinedUid == uid }) else { return }
         
         // 更新用户
         users[index] = update(users[index])
         
         // 保存回 UserDefaults
         saveUsers(users)
     }
    
    func initializeDefaultArticles() {
        if storage.data(forKey: focalizingPost) != nil { return }

        let defaultPosts: [LuxuriousPost] = [
              LuxuriousPost(
                  matchingPid: 1,
                  structuredText: "This is a very versatile set of accessories, making one look much more refined",
                  pendantLikes: [],
                  obsidianUid: 4,
                  ceramicImg: "ioubnxcy_p4",
                  titaniumUrl: "iuncqwe_v4"
              ),
              LuxuriousPost(
                  matchingPid: 2,
                  structuredText: "The outfit and jewelry of the day! The wind was a paid actor haha",
                  pendantLikes: [],
                  obsidianUid: 5,
                  ceramicImg: "ioubnxcy_p5",
                  titaniumUrl: "iuncqwe_v5"
              ),
              LuxuriousPost(
                  matchingPid: 3,
                  structuredText: "Stop saying that accessories are picky about people! A versatile piece that both boys and girls can wear, instantly enhancing the atmosphere",
                  pendantLikes: [],
                  obsidianUid: 1,
                  ceramicImg: "ioubnxcy_p1",
                  titaniumUrl: "iuncqwe_v1"
              ),
              LuxuriousPost(
                  matchingPid: 4,
                  structuredText: "Reject uniformity! The same piece of jewelry can also create different styles.",
                  pendantLikes: [],
                  obsidianUid: 6,
                  ceramicImg: "ioubnxcy_p6",
                  titaniumUrl: "iuncqwe_v6"
              ),
              LuxuriousPost(
                  matchingPid: 5,
                  structuredText: "Add more colored accessories to make your outfit more vibrant",
                  pendantLikes: [],
                  obsidianUid: 2,
                  ceramicImg: "ioubnxcy_p2",
                  titaniumUrl: "iuncqwe_v2"
              ),
              LuxuriousPost(
                  matchingPid: 6,
                  structuredText: "As soon as you put on sunglasses and a hat, your style changes immediately",
                  pendantLikes: [],
                  obsidianUid: 3,
                  ceramicImg: "ioubnxcy_p3",
                  titaniumUrl: "iuncqwe_v3"
              ),
          ]

        if let data = try? JSONEncoder().encode(defaultPosts) {
            storage.set(data, forKey: focalizingPost)
        }
    }

    func getUsers() -> [PolishedUser] {
        guard let data = storage.data(forKey: usersKey),
              let users = try? JSONDecoder().decode([PolishedUser].self, from: data) else {
            return []
        }
        return users
    }

    func saveUsers(_ users: [PolishedUser]) {
        if let data = try? JSONEncoder().encode(users) {
            storage.set(data, forKey: usersKey)
        }
    }
    
    func deleteUser(uid: Int) {

        
        guard uid != -1 else { return }

       
        var users = getUsers()
        users.removeAll { $0.refinedUid == uid }

     
        users = users.map { user in
            var u = user
            u.centeringFollow.removeAll { $0 == uid }
            u.stylingFans.removeAll { $0 == uid }
            u.platinumBlock.removeAll { $0 == uid }
            return u
        }
        saveUsers(users)

     
        var posts = getPosts()
        posts.removeAll { $0.obsidianUid == uid }
        savePosts(posts)

       
        var comments = getComments()
        comments.removeAll { $0.artisanalUid == uid }
        saveComments(comments)

        var layeringComments = getLayeringComments()
        layeringComments.removeAll { $0.bronzetoneUid == uid }
        saveLayeringComments(layeringComments)

      
        var discoverPosts = getDiscoverPosts()
        discoverPosts.removeAll { $0.oxidizedUid == uid }
        saveDiscoverPosts(discoverPosts)

        
        var messages = getCollecleMessages()
        let removedChatIds = messages
            .filter { $0.simplifUsers.contains(uid) }
            .map { $0.ornamentMid }

        messages.removeAll { $0.simplifUsers.contains(uid) }
        saveCollecleMessages(messages)

        var infos = getWaistchainInfos()
        infos.removeAll { info in
            info.elevatingUid == uid ||
            removedChatIds.contains(info.ahairpinrlsMid)
        }
        saveWaistchainInfos(infos)

       
        if getCurrentUserId() == uid {
            clearCurrentUser()
        }
    }
    
    @discardableResult
        func addUser(
            elegantName: String = "User",
            accentingCoin: Int = 0,
            pairingAvatar: String = "ornixIcon",
            anchoringEmail: String = "",
            crystalsPassword: String = "",
            platinumBlock: [Int] = [],
            centeringFollow: [Int] = [],
            stylingFans: [Int] = []
        ) -> Int {
            var users = getUsers()
            let tepasteldNum = Int.random(in: 100...999)
                    
                    
                    let antiqueName = "\(elegantName)\(tepasteldNum)"
          
            let retranusoUid = (users.map { $0.refinedUid }.max() ?? 0) + 1
            
           
            let cyingoUser = PolishedUser(
                refinedUid: retranusoUid,
                elegantName: antiqueName,
                accentingCoin: accentingCoin,
                pairingAvatar: pairingAvatar,
                anchoringEmail: anchoringEmail,
                crystalsPassword: crystalsPassword,
                platinumBlock: platinumBlock,
                centeringFollow: centeringFollow,
                stylingFans: stylingFans
            )
            
           
            users.append(cyingoUser)
            saveUsers(users)
            
           
            
          
            return cyingoUser.refinedUid
        }
    
    //关注
    func toggleFollow(targetUid: Int) {
        let currentUid = getCurrentUserId()
        guard currentUid != -1, currentUid != targetUid else { return }

        var users = getUsers()
        guard let currentIndex = users.firstIndex(where: { $0.refinedUid == currentUid }),
              let targetIndex = users.firstIndex(where: { $0.refinedUid == targetUid }) else { return }

       
        var currentUser = users[currentIndex]
        var targetUser = users[targetIndex]

        if currentUser.centeringFollow.contains(targetUid) {
           
            currentUser.centeringFollow.removeAll { $0 == targetUid }
            targetUser.stylingFans.removeAll { $0 == currentUid }
        } else {
          
            currentUser.centeringFollow.append(targetUid)
            targetUser.stylingFans.append(currentUid)
        }

      
        users[currentIndex] = currentUser
        users[targetIndex] = targetUser
        
       
        saveUsers(users)
    }
    
    func isFollowing(targetUid: Int) -> Bool {
            let currentUid = getCurrentUserId()
            guard currentUid != -1 else { return false }
            let users = getUsers()
            guard let currentUser = users.first(where: { $0.refinedUid == currentUid }) else { return false }
            return currentUser.centeringFollow.contains(targetUid)
        }
    
    
    private let currentUserIdKey = "currentUserId"

    func saveCurrentUserId(_ uid: Int) {
        storage.set(uid, forKey: currentUserIdKey)
    }

    func getCurrentUserId() -> Int {
        let uid = storage.integer(forKey: currentUserIdKey)
        return uid == 0 ? -1 : uid
    }

    func clearCurrentUser() {
        
        storage.removeObject(forKey: currentUserIdKey)
    }
    
    
    private let touristsUserIdKey = "touristsUserIdKey"

    func saveTouristsUserId(_ uid: Int) {
        storage.set(uid, forKey: touristsUserIdKey)
    }

    func getTouristsUserId() -> Int {
        let uid = storage.integer(forKey: touristsUserIdKey)
        return uid == 0 ? -1 : uid
    }

    func clearTouristsUser() {
        
        storage.removeObject(forKey: touristsUserIdKey)
    }
    
    
    
    
    
    func getPosts() -> [LuxuriousPost] {
        guard let data = storage.data(forKey: focalizingPost),
              let posts = try? JSONDecoder().decode([LuxuriousPost].self, from: data) else {
            return []
        }
        return posts
    }
    
    func getPosts(by uid: Int) -> [LuxuriousPost] {
        getPosts().filter { $0.obsidianUid == uid }
    }
    func savePosts(_ posts: [LuxuriousPost]) {
        if let data = try? JSONEncoder().encode(posts) {
            storage.set(data, forKey: focalizingPost)
        }
    }
    
    func addPost(_ post: LuxuriousPost) {
        var posts = getPosts()
        posts.append(post)
        savePosts(posts)
    }
    func togglePostLike(postId: Int) {
       
        var posts = getPosts()

        guard let index = posts.firstIndex(where: { $0.matchingPid == postId }) else { return }

        if posts[index].pendantLikes.contains(getCurrentUserId()) {
            posts[index].pendantLikes.removeAll { $0 == getCurrentUserId() }
        } else {
            posts[index].pendantLikes.append(getCurrentUserId())
        }

        savePosts(posts)
    }
    
    //评论
    func getComments() -> [EclectiComment] {
        guard let data = storage.data(forKey: commentsKey),
              let comments = try? JSONDecoder().decode([EclectiComment].self, from: data) else {
            return []
        }
        return comments
    }
    func getComments(by postId: Int) -> [EclectiComment] {
        let blockList = getUsers()
            .first { $0.refinedUid == getCurrentUserId() }?
            .platinumBlock ?? []

        return getComments().filter {
            $0.matchingPid == postId
            && !blockList.contains($0.artisanalUid)
        }
    }
    func saveComments(_ comments: [EclectiComment]) {
        if let data = try? JSONEncoder().encode(comments) {
            storage.set(data, forKey: commentsKey)
        }
    }
    func addComment(_ comment: EclectiComment) {
        var comments = getComments()
        comments.append(comment)
        saveComments(comments)
    }
   //发现帖子
    func initializeDefaultDiscoverPosts() {
        if storage.data(forKey: discoverPostKey) != nil { return }

        let defaultPosts: [DiscoverPost] = [
            DiscoverPost(
                glamorousPid: 1,
                earthtoneText: "Small details on the wrist can make a big difference in your presence! For boys, wearing a bracelet, choosing the right style is a must-have for a stylish man. It's simple and not flamboyant.",
                sapphireLikes: [],
                oxidizedUid: 3,
                undertoneImg: ["yquwinda_d1"]
            ),
            DiscoverPost(
                glamorousPid: 2,
                earthtoneText: "The ultimate code for a gentle breeze: One pearl accessory is enough! Whether it's a collarbone chain or small stud earrings, they can instantly make your outfit more refined",
                sapphireLikes: [],
                oxidizedUid: 4,
                undertoneImg: ["yquwinda_d2","yquwinda_d3"]
            ),
            DiscoverPost(
                glamorousPid: 3,
                earthtoneText: "Tying up her hair, revealing her earrings, with a small gesture, her charm is instantly elevated",
                sapphireLikes: [],
                oxidizedUid: 5,
                undertoneImg: ["yquwinda_d4"]
            ),
           
        ]

        if let data = try? JSONEncoder().encode(defaultPosts) {
            storage.set(data, forKey: discoverPostKey)
        }
    }
    
    func getDiscoverPosts() -> [DiscoverPost] {
        guard let data = storage.data(forKey: discoverPostKey),
              let posts = try? JSONDecoder().decode([DiscoverPost].self, from: data) else {
            return []
        }
        return posts
    }
    
    func saveDiscoverPosts(_ posts: [DiscoverPost]) {
        if let data = try? JSONEncoder().encode(posts) {
            storage.set(data, forKey: discoverPostKey)
        }
    }
    
    func addDiscoverPost(_ post: DiscoverPost) {
        var posts = getDiscoverPosts()
        posts.append(post)
        saveDiscoverPosts(posts)
    }
    
    func toggleDiscoverPostLike(postId: Int, ) {
        var posts = getDiscoverPosts()

        guard let index = posts.firstIndex(where: { $0.glamorousPid == postId }) else { return }

        if posts[index].sapphireLikes.contains(getCurrentUserId()) {
            posts[index].sapphireLikes.removeAll { $0 == getCurrentUserId() }
        } else {
            posts[index].sapphireLikes.append(getCurrentUserId())
        }

        saveDiscoverPosts(posts)
    }
    
    //发现评论
    func getLayeringComments() -> [LayeringComment] {
        guard let data = storage.data(forKey: layeringCommentsKey),
              let comments = try? JSONDecoder().decode([LayeringComment].self, from: data) else {
            return []
        }
        return comments
    }
    func getLayeringComments(by pid: Int) -> [LayeringComment] {
        let blockList = getUsers()
            .first { $0.refinedUid == getCurrentUserId() }?
            .platinumBlock ?? []
        return getLayeringComments().filter { $0.casualwearPid == pid
            && !blockList.contains($0.bronzetoneUid)
        }
    }
    
    func saveLayeringComments(_ comments: [LayeringComment]) {
        if let data = try? JSONEncoder().encode(comments) {
            storage.set(data, forKey: layeringCommentsKey)
        }
    }
    
    func addLayeringComment(_ comment: LayeringComment) {
        var comments = getLayeringComments()
        comments.append(comment)
        saveLayeringComments(comments)
    }
    
    //聊天
    func initializeDefaultCollecleMessages() {
        if storage.data(forKey: collecleMessageKey) != nil { return }

        let defaultMessages: [CollecleMessage] = [
            CollecleMessage(
                ornamentMid: 1,
                matchedEndText: "Hi",
                simplifUsers: [1,2],
                comegrEndTime: "12-23",
            )
        ]

        if let data = try? JSONEncoder().encode(defaultMessages) {
            storage.set(data, forKey: collecleMessageKey)
        }
    }
    
    func getCollecleMessages() -> [CollecleMessage] {
        guard let data = storage.data(forKey: collecleMessageKey),
              let messages = try? JSONDecoder().decode([CollecleMessage].self, from: data) else {
            return []
        }
        return messages
    }
    
    func getCollecleMessages(by uid: Int) -> [CollecleMessage] {
        getCollecleMessages().filter { $0.simplifUsers.contains(uid) }
    }
    func saveCollecleMessages(_ messages: [CollecleMessage]) {
        if let data = try? JSONEncoder().encode(messages) {
            storage.set(data, forKey: collecleMessageKey)
        }
    }
    func addCollecleMessage(_ message: CollecleMessage) {
        var messages = getCollecleMessages()
        messages.append(message)
        saveCollecleMessages(messages)
    }
    func updateLastMessage(
        ornamentMid: Int,
        text: String,
        time: String
    ) {
        var messages = getCollecleMessages()
        guard let index = messages.firstIndex(where: { $0.ornamentMid == ornamentMid }) else { return }

        messages[index].matchedEndText = text
        messages[index].comegrEndTime = time

        saveCollecleMessages(messages)
    }
    
    
    func findOrCreateCollecleMessage(
        uid1: Int,
        uid2: Int
    ) -> Int {
        var messages = getCollecleMessages()

        // 1️⃣ 先查是否已经存在这两个人的聊天
        if let existing = messages.first(where: {
            $0.simplifUsers.contains(uid1) &&
            $0.simplifUsers.contains(uid2)
        }) {
            return existing.ornamentMid
        }

        // 2️⃣ 不存在 → 创建新聊天
        let newId = (messages.map { $0.ornamentMid }.max() ?? 0) + 1

        let newMessage = CollecleMessage(
            ornamentMid: newId,
            matchedEndText: "",
            simplifUsers: [uid1, uid2],
            comegrEndTime: ""
        )

        messages.append(newMessage)
        saveCollecleMessages(messages)

        return newId
    }
    
    func getOtherUser(
        from message: CollecleMessage
    ) -> PolishedUser? {
        let currentUid = getCurrentUserId()
        
        guard let otherUid = message.simplifUsers.first(where: { $0 != currentUid }) else {
            return nil
        }
        
        return getUsers().first(where: { $0.refinedUid == otherUid })
    }

    //聊天详情
    func initializeDefaultWaistchainInfos() {
        if storage.data(forKey: waistchainInfoKey) != nil { return }

        let defaultInfos: [WaistchainInfo] = [
            WaistchainInfo(
                ginframinId: 1,
                ankletpinText: "Hi",
                ahairpinrlsMid: 1,
                elevatingUid: 2,
                armcandyVoice: "",
                cashawlrfLong: "",
            )
        ]

        if let data = try? JSONEncoder().encode(defaultInfos) {
            storage.set(data, forKey: waistchainInfoKey)
        }
    }
    
    func getWaistchainInfos() -> [WaistchainInfo] {
        guard let data = storage.data(forKey: waistchainInfoKey),
              let infos = try? JSONDecoder().decode([WaistchainInfo].self, from: data) else {
            return []
        }
        return infos
    }
    func getWaistchainInfos(by chatId: Int) -> [WaistchainInfo] {
        getWaistchainInfos().filter { $0.ahairpinrlsMid == chatId }
    }
    func saveWaistchainInfos(_ infos: [WaistchainInfo]) {
        if let data = try? JSONEncoder().encode(infos) {
            storage.set(data, forKey: waistchainInfoKey)
        }
    }
    
    func addWaistchainInfo(
        chatId: Int,
        text: String,
        voice: String = "",
        ringsLong: String = ""
    ) {
        var infos = getWaistchainInfos()
        let newId = (infos.map { $0.ginframinId }.max() ?? 0) + 1

//        let formatter = DateFormatter()
//        formatter.dateFormat = "yyyy-MM-dd HH:mm"
//        let time = formatter.string(from: Date())

        let newInfo = WaistchainInfo(
            ginframinId: newId,
            ankletpinText: text,
            ahairpinrlsMid: chatId,
            elevatingUid: getCurrentUserId(),
            armcandyVoice: voice,
            cashawlrfLong: ringsLong
        )

        infos.append(newInfo)
        saveWaistchainInfos(infos)
    }
}
