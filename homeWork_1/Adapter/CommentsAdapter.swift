//
//  CommentsAdapter.swift
//  homeWork_1
//
//  Created by Артур Дохно on 26.12.2021.
//  Copyright © 2021 Марат Нургалиев. All rights reserved.
//

import UIKit
import Alamofire

protocol CommentsInterface {
    func getComments(ownerId: Int, postId: Int, completion: @escaping ([VkComment]) -> Void)
}

final class CommentsAdapter: CommentsInterface {
    
    func getComments(ownerId: Int, postId: Int, completion: @escaping ([VkComment]) -> Void) {
        //delegate: VkApiFeedsDelegate) {
        let method = "wall.getComments"
        let fullRow = "\(GlobalConstants.vkApi)\(method)"
        let params: Parameters = [
            "access_token": Session.instance.token,
            "filters": "post",
            "v": "5.87",
            "count":"50",
            "sort":"desc",
            "need_likes":"1",
            "extended":"1",
            "owner_id":"\(ownerId)",
            "post_id":"\(postId)"
        ]
        
        Alamofire.request(fullRow, method: .get, parameters: params)
            .responseJSON(queue: DispatchQueue.global(qos: .userInteractive)) { response in
                print(response.result)
                let comments = VkResponseParser.instance
                    .parseComments(result: response.result)
                DispatchQueue.main.async {
                    completion(comments)
                }
            }
    }
}


