//
//  Utils.swift
//  BradsDeals
//
//  Created by David Williams on 1/12/24.
//

import Foundation

class Utils {
    
    public static var shared = Utils()
    
    func formatMarkdown(text: String) -> String {
        let regexPattern = "<a href=\"(.*?)\">(.*?)</a>"

        let regex = try! NSRegularExpression(pattern: regexPattern, options: [])
        let range = NSRange(text.startIndex..<text.endIndex, in: text)

        let markdownString = regex.stringByReplacingMatches(in: text, options: [], range: range, withTemplate: "[$2]($1)")

        return markdownString
    }
}
