import UIKit

protocol ISequence {
    associatedtype ItemType
    func GetEqualityComponents() -> Bool;
}

protocol CompareItems {
    func compare() -> Bool;
}


struct ValueObject<T> {

    public func Equals(obj: T?) -> Bool {
        if (obj == nil) {
            return false
        }

        if (type(of: self) != type(of: obj)) {
            return false
        }

        return true;
    }


}
