//Solution goes in Sources
import Foundation

enum TranslationRNAError:Error {
    case error
}

class ProteinTranslation {
 
    static let codon: [String: String] = ["AUG": "Methionine",
                                   "UUC": "Phenylalanine", "UUU": "Phenylalanine",
                                   "UUA": "Leucine", "UUG": "Leucine",
                                   "UCU": "Serine", "UCC": "Serine", "UCA": "Serine", "UCG": "Serine",
                                   "UAU": "Tyrosine", "UAC": "Tyrosine",
                                   "UGU": "Cysteine", "UGC": "Cysteine",
                                   "UGG": "Tryptophan",
                                   "UAA": "STOP", "UAG": "STOP", "UGA": "STOP"]
    
    static func translationOfCodon(_ input:String) throws -> String {
        guard let translation = codon[input] else {
            throw TranslationRNAError.error
        }
        return translation
    }
    
    static func translationOfRNA(_ inputRNA: String) throws -> [String] {
        var arr = [String]()
        var result = inputRNA
        while !result.isEmpty {
            let str = result.prefix(3)
            arr.append(String(str))
            result = String(result.dropFirst(3))
        }
        var protein = [String]()
        for i in arr {
            if codon[i] == nil {
                throw TranslationRNAError.error
            } else if codon[i] == "STOP"{
                break
            } else {
                protein.append(codon[i]!)
            }
        }
        return protein.removeDuplicates()
    }
}

extension Array where Element:Equatable {
    func removeDuplicates() -> [Element] {
        var result = [Element]()
        
        for value in self {
            if result.contains(value) == false {
                result.append(value)
            }
        }
        
        return result
    }
}
