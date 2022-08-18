//
//  Extensions+UIImageVIew.swift
//  App
//
//  Created by Alexander Chervoncev on 30.07.22.
//

import UIKit

extension UIImageView {
    func loadImage(with url: String, placeholder: UIImage? = nil) {
        self.image = nil
        
        let iconUrl = url.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
        DispatchQueue.global(qos: .userInitiated).async {
            if let url = URL(string: iconUrl) {
                URLSession.shared.dataTask(with: url) { data, response, error in
                    if error != nil {
                        DispatchQueue.main.async {
                            self.image = placeholder
                        }
                        return
                    }
                    DispatchQueue.main.async {
                        if let data = data {
                            if let image = UIImage(data: data) {
                                self.image = image
                            }
                        }
                    }
                }.resume()
            }
        }
    }
}
