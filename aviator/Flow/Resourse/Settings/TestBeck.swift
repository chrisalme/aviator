//
//  TestBeck.swift
//  aviator
import Foundation

enum ModelsError: Error {
    case unknown
    case noData
}

class TestBeck {
    
    static let shared = TestBeck()
    
    func readFromGiftsData(successCompletion: @escaping ([GiftsModel]) -> Void, errorComletion: @escaping (Error) -> Void) {
        guard let url = Bundle.main.url(forResource: "DataGifts", withExtension: nil) else {
            print("Failed to locate  in bundle.")
            errorComletion(ModelsError.unknown)
            
            return
        }
        guard let data = try? Data(contentsOf: url) else {
            print("Failed to load  from bundle.")
            errorComletion(ModelsError.noData)
            
            return
        }
        
        do {
            let decoder = JSONDecoder()
            let model = try decoder.decode([GiftsModel].self, from: data)
                successCompletion(model)
                print(model)
        }catch{
            print("error", error)
            errorComletion(error)
        }
    }
}
