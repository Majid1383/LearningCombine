//
//  SearchViewModel.swift
//  LearningCombine
//
//  Created by AbdulMajid Shaikh on 07/01/26.
//

import Foundation
import Combine

class ServiceViewModel: ObservableObject{
    
    //Input
    @Published var searchText : String  = ""
    
    //Output
    @Published var isValidSearch: Bool = false
    @Published var statusMessage: String = "Start typing..."
    
    private var cancellable = Set<AnyCancellable>()
    
    init(){
        setupSearchPipeline()
    }
    
    private func setupSearchPipeline(){
        
        $searchText
            .debounce(for: .milliseconds(500), scheduler: RunLoop.main)
            .removeDuplicates()
            .map { text in
                text.count >= 3
            }
            .sink { [weak self] isValid in
                self?.isValidSearch = isValid
                self?.statusMessage = isValid
                ? "Valid search input" : "Minimum 3 characters required"
                
            }
            .store(in: &cancellable)
    }
    
}
