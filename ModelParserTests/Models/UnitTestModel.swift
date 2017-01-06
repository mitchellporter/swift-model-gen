// Generated using SwiftGen, by O.Halligon — https://github.com/AliSoftware/SwiftGen

import ModelParser

public final class UnitTestModel: DataModel, Equatable {

  // MARK: Instance Variables

  /**
   First name of the unit test
   */
  public let firstName: String?
  public let lastName: String
  public let friends: [UnitTestModel]
  /**
   An optional array
   */
  public let optFriends: [UnitTestModel]?
  public let age: Int?

  // MARK: Initializers

  public init(firstName: String?, lastName: String, friends: [UnitTestModel], optFriends: [UnitTestModel]?, age: Int?) {
    self.firstName = firstName
    self.lastName = lastName
    self.friends = friends
    self.optFriends = optFriends
    self.age = age
  }

  public convenience init?(dictionary: [String: Any]) {
    try? self.init(dictionary: dictionary, error: { _ in })
  }

  public convenience init?(dictionary: [String: Any], error: ((String) throws -> Void)) rethrows {
    try? self.init(dictionary: dictionary as NSDictionary, error: error)
  }

  public convenience init?(dictionary: NSDictionary) {
    try? self.init(dictionary: dictionary, error: { _ in })
  }

  public init?(dictionary: NSDictionary, error: ((String) throws -> Void)) rethrows {
    let parser = Parser(dictionary: dictionary)
    self.firstName = try parser.fetch("firstName", error: error)
    guard let lastName: String = try parser.fetch("lastName", error: error) else {
      try error("Required field 'lastName' is missing from type 'UnitTestModel'")
      return nil
    }
    self.lastName = lastName
    self.friends = try parser.fetch("friends", error: error)
    self.optFriends = try parser.fetch("optFriends", error: error)
    self.age = try parser.fetch("age", error: error)
  }

  public static func make(withDictionary dictionary: [String: Any]) throws -> Self {
    return try make(withDictionary: dictionary as NSDictionary)
  }

  public static func make(withDictionary dictionary: NSDictionary) throws -> Self {
    let model = try self.init(dictionary: dictionary) { error in
      throw ParseError(message: error)
    }
    if let model = model {
      return model
    } else {
      throw ParseError(message: "Model returned nil with no error.")
    }
  }

  public static func parse(data: Any, error: (String) throws -> Void) rethrows -> UnitTestModel? {
    if let data = data as? NSDictionary {
      return try self.init(dictionary: data, error: error)
    } else {
      try error("Models must be initialized with NSDictionary. Instead, got \(type(of: data))")
      return nil
    }
  }

  // MARK: Data

  public func data() -> [String: Any] {
    var data = [String: Any]()
    data["firstName"] = firstName?.dataRepresentation()
    data["lastName"] = lastName.dataRepresentation()
    data["friends"] = friends.map { $0.dataRepresentation() }
    data["optFriends"] = optFriends?.map { $0.dataRepresentation() }
    data["age"] = age?.dataRepresentation()
    return data
  }

  // MARK: Builder

  public func map(update: (Builder)->()) -> UnitTestModel {
    let builder = Builder(copy: self)
    update(builder)
    return builder.build()
  }

  public final class Builder {
    public var firstName: String?
    public var lastName: String
    public var friends: [UnitTestModel]
    public var optFriends: [UnitTestModel]?
    public var age: Int?

    public init(copy: UnitTestModel) {
      firstName = copy.firstName
      lastName = copy.lastName
      friends = copy.friends
      optFriends = copy.optFriends
      age = copy.age
    }

    public func build() -> UnitTestModel {
      return UnitTestModel(firstName: firstName, lastName: lastName, friends: friends, optFriends: optFriends, age: age)
    }
  }
}

public func == (lhs: UnitTestModel, rhs: UnitTestModel) -> Bool {
  return lhs.firstName == rhs.firstName &&
    lhs.lastName == rhs.lastName &&
    lhs.friends == rhs.friends &&
    lhs.optFriends == rhs.optFriends &&
    lhs.age == rhs.age
}

