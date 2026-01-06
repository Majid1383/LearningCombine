//
//  ContentView.swift
//  LearningCombine
//
//  Created by AbdulMajid Shaikh on 07/01/26.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var searchViewModel : ServiceViewModel = ServiceViewModel()
    
    var body: some View {
        
        VStack{
            
            TextField("Search...",
                      text: $searchViewModel.searchText)
            .textFieldStyle(.roundedBorder)
            .padding()
            
            Text(searchViewModel.statusMessage)
                .foregroundColor(
                    searchViewModel.isValidSearch ? .green : .red
                )
            
            Spacer()
        }
    }
}

#Preview {
    ContentView()
}
