//
//  NetworkingServiceMock.swift
//  BoardGameList-CleanArchi
//
//  Created by Phetsana PHOMMARINH on 30/09/2020.
//

import Foundation
import Combine

#if DEBUG
final class NetworkingServiceMock: BoardGameAtlasNetworkingServiceImpl {
    let error: NetworkingError?
    let isLoading: Bool
    init(error: NetworkingError? = nil, isLoading: Bool = false) {
        self.error = error
        self.isLoading = isLoading
        super.init()
    }
    
    override func send<T>(_ request: T) -> AnyPublisher<T.Response, NetworkingError> where T: NetworkingRequest {
        if let error = error {
            return Fail(error: error).eraseToAnyPublisher()
        }

        return super.send(request)
            .delay(for: isLoading ? .seconds(Int.max) : .zero, scheduler: RunLoop.main).eraseToAnyPublisher()
    }
}
#endif
