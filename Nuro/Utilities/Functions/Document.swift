//
//  Document.swift
//  Nuro
//
//  Created by Karen Natalia on 01/11/22.
//

import Foundation
import UIKit

class Document {
    
    static func getImageFromDocument(imageURL: String?) -> UIImage {
        let imageURL = Paths.documentPath.appendingPathComponent(imageURL ?? "")
        return UIImage(contentsOfFile: imageURL.path) ?? UIImage()
    }
    
    static func saveToDocument(image: UIImage?) -> String {
        let fileName = "\(Date.generateTimestampForFilename()).jpg"
        let url = Paths.documentPath.appendingPathComponent(fileName)
        if let image = image {
            let imageData = image.jpegData(compressionQuality: 1.0)
            do {
                try imageData?.write(to: url)
            } catch {
                print("Failed to save image to document")
            }
        }
        return fileName
    }
    
    static func removeFromDocument(imageURL: String) {
        let url = Paths.documentPath.appendingPathComponent(imageURL)
        do {
            try FileManager.default.removeItem(atPath: url.path)
        } catch {
            print("Failed to remove image from document")
        }
    }
}
