import Foundation

public enum NetworkError: Error, Equatable {
    case invalidResponse
    case unexpectedStatusCode(Int)
}

public final class NetworkManager {
    private let session: URLSession
    private let decoder: JSONDecoder

    public init(
        session: URLSession = .shared,
        decoder: JSONDecoder = JSONDecoder()
    ) {
        self.session = session
        self.decoder = decoder
    }

    public func fetch<Response: Decodable>(
        _ responseType: Response.Type,
        from url: URL
    ) async throws -> Response {
        let (data, response) = try await session.data(from: url)
        try validate(response)

        return try decoder.decode(responseType, from: data)
    }

    private func validate(_ response: URLResponse) throws {
        guard let httpResponse = response as? HTTPURLResponse else {
            throw NetworkError.invalidResponse
        }

        guard (200...299).contains(httpResponse.statusCode) else {
            throw NetworkError.unexpectedStatusCode(httpResponse.statusCode)
        }
    }
}
