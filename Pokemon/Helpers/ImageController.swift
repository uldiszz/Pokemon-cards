//
//  ImageController.swift
//  Pokemon
//
//  Created by Uldis on 24/04/2018.
//  Copyright © 2018 Uldis. All rights reserved.
//

import UIKit

class ImageController {
    
    static func getImage(for url: String, completion: @escaping (UIImage?) -> Void) {
        guard let imageUrl = URL(string: url) else {
            fatalError("Could not create url from string: \(url)")
        }
        
        NetworkController.performRequest(for: imageUrl, httpMethod: .Get) { (data, error) in
            guard let data = data, let image = UIImage(data: data) else {
                DispatchQueue.main.async { completion(nil) }
                return
            }
            
            DispatchQueue.main.async { completion(image) }
        }
    }
    
}
