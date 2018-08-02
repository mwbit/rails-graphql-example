Types::QueryType = GraphQL::ObjectType.define do
  name "Query"
  
  field :user, Types::UserType do

    argument :id, types.ID 
    description "User Identification"

    resolve -> (obj, args, ctx) {
      User.where(id: args[:id]).first
    }
  
  end

  name "Query"
  
  field :allUsers, types[Types::UserType] do

    description "Return all users"
    resolve -> (obj, args, ctx) {
      User.all
    }
  
  end

 end