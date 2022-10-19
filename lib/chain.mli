type chain = {
  genesis : Block.t;
  blocks : Block.t list;
  transactions : Transaction.Signed.t list;
  difficulty : int;
}

and t = chain

val empty : chain
val add_block : Block.t -> chain -> chain
val last_block : chain -> Block.t
val is_valid : chain -> bool
val mine : chain -> chain

type add_transaction_error = Invalid_signature | Not_enought_funds

val add_transaction :
  Transaction.Signed.t -> chain -> (chain, add_transaction_error) result
