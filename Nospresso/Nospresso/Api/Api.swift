//
//  api.swift
//  Nospresso
//
//  Created by Emilio Heinzmann on 13/10/20.
//

import Foundation

class Api {
    let urlBase: String = "http://localhost:3000"
    typealias ResultadoSucesso<T: Decodable> = (T) -> Void
    typealias ResultadoFalha = (String) -> Void
    
    func requisitar<T: Decodable>(endpoint: Endpoint, sucesso: @escaping ResultadoSucesso<T>, falha: @escaping ResultadoFalha) {
        let urlCompleta = "\(urlBase)/\(endpoint.url)"
        
        print(urlCompleta)
        
        guard let url = URL(string: urlCompleta) else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { (dados, resposta, erro) in
//            if let dados = dados {
//                print(String(data: dados, encoding: .utf8)!)
//            }
            
            guard erro == nil else {
                // TODO validar erro
                print("GUARD ERRO")
                return
            }
            
            guard let dados = dados else {
                // TODO validar dadons inválidos
                print("GUARD DADOS")
                return
            }
            
            let decodificador = JSONDecoder()
            
            do {
                let dadosConvertidos = try decodificador.decode(T.self, from: dados)
                sucesso(dadosConvertidos)
            } catch {
                // TODO tratar erro
                print(error)
            }
            
        }.resume()
    }
}
