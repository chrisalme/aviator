//
//  GetService.swift
//  aviator


import Foundation

enum EventServiceError: Error {
    case unkonwn
    case noData
}

class GetService {

    static let shared = GetService()
    private init() {}
    
    private let urlStringGifts = "https://aviatorgame-backend-6ff168b0f620.herokuapp.com/api/gifts"
    private let urlStringEvent = "https://aviatorgame-backend-6ff168b0f620.herokuapp.com/api/events"


    func fetchGift(successCompletion: @escaping([GiftsModel]) -> Void, errorCompletion: @escaping (Error) -> Void) {

        guard let url = URL(string: urlStringGifts) else {
            print("Неверный URL")
            return
        }

        var request = URLRequest(url: url)
        request.httpMethod = "GET"
     
        
        guard let token = AuthService.shared.token else { return }
        request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                DispatchQueue.main.async {
                    errorCompletion(EventServiceError.noData)
                }
                return
            }
            
            guard let data = data else {
                DispatchQueue.main.async {
                    errorCompletion(EventServiceError.unkonwn)
                }
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let gifts = try decoder.decode([GiftsModel].self, from: data)
                DispatchQueue.main.async {
                    successCompletion(gifts)
                    print("Gifts - \(gifts)")
                }
            }catch {
                print("error", error)
                
                DispatchQueue.main.async {
                    errorCompletion(error)
                }
            }
        }
        task.resume()
    }
    
    func fetchEvent(successCompletion: @escaping([AddNewModel]) -> Void, errorCompletion: @escaping (Error) -> Void) {

        guard let url = URL(string: urlStringEvent) else {
            print("Неверный URL")
            return
        }

        var request = URLRequest(url: url)
        request.httpMethod = "GET"
     
        
        guard let token = AuthService.shared.token else { return }
        request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                DispatchQueue.main.async {
                    errorCompletion(EventServiceError.noData)
                }
                return
            }
            
            guard let data = data else {
                DispatchQueue.main.async {
                    errorCompletion(EventServiceError.unkonwn)
                }
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let event = try decoder.decode([AddNewModel].self, from: data)
                DispatchQueue.main.async {
                    successCompletion(event)
                    print("EVENTS - \(event)")
                }
            }catch {
                print("error", error)
                
                DispatchQueue.main.async {
                    errorCompletion(error)
                }
            }
        }
        task.resume()
    }
}
