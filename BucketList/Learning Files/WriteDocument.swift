//
//  WriteDocument.swift
//  BucketList
//
//  Created by Hakan Aktürk on 12.01.2023.
//

import SwiftUI

struct WriteDocument: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .onTapGesture {
                let str = "Test message"
                let url = getDocumentsDirectory().appendingPathComponent("message.txt")
                
                do {
                    try str.write(to: url, atomically: true, encoding: .utf8)
                    let input = try String(contentsOf: url)
                    print(input)
                } catch {
                    print(error.localizedDescription)
                }
            }
    }
    //MARK: - user documents directory for the user for our app
    func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
}

struct WriteDocument_Previews: PreviewProvider {
    static var previews: some View {
        WriteDocument()
    }
}
