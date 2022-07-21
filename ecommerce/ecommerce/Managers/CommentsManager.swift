//
//  CommentsManager.swift
//  ecommerce
//
//  Created by Vincent Salinas on 7/12/22.
//

import Foundation

class CommentsManager: ObservableObject {
    @Published private(set) var comments: [CommentModel] = []
    
    func addComment(commentObj: CommentModel) {
        comments.append(CommentModel(commentID: commentObj.commentID, productID: commentObj.productID, username: commentObj.username, title: commentObj.title, date: commentObj.date, body: commentObj.body))
    }
    
//    func getComments(productID: Int) -> [CommentModel] {
//        return CDCommentHelper.cdCommentHelper.getComments()
//    }
    
    func loadComments(commentsData: [CommentModel]) {
        comments = commentsData
    }
    
}
