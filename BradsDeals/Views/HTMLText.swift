//
//  HTMLText.swift
//  BradsDeals
//
//  Created by David Williams on 1/12/24.
//

import SwiftUI
import UIKit

struct HTMLTextView: View {
    var body: some View {
        
        let str = """

Save 70% or more on on the entire <a href="https://www.bradsdeals.com/go/p/627450">Enchanted Disney fine jewelry collection</a> at <a href="https://www.bradsdeals.com/go/p/627450">Macys.com</a>. Many pieces are marked down to the lowest prices we've ever seen! Shipping is free. The pictured <a href="https://www.bradsdeals.com/go/p/627450-1">1/10ct Diamond Cinderella Tiara Necklace in Sterling Silver</a>, listed at $319, drops to $82.70. Similar necklaces sell elsewhere for $135 or more. The diamonds are I-J color and I2-I3 clarity. The sale includes 59 pieces.
"""
        
        let markdownLink = try! AttributedString(markdown: str)
        Text(.init(str))
    }
}

#Preview {
    HTMLTextView()
}
