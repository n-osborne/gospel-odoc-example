(** This is a top level module documentation *)

(** Informal documentation fot the type t *)
type 'a t
(*@
  (** t is a container, let's give it two models:
      - one for the size
      - one for the contents *)
  model size : integer
  mutable model contents : 'a seq *)

(** build an empty container *)
val empty : int -> 'a t
(*@ t = empty n
    (** Some interleaved informal documentation here *)
    ensures t.size = n
    ensures Seq.length t.contents = 0 *)

(** Let's define a gospel predicate *)
(*@ predicate eq (t0 t1 : 'a t) =
      Seq.length t0.contents = Seq.length t1.contents /\ forall i. 0 <= i < Seq.length t0.contents -> Seq.get t0.contents i = Seq.get t1.contents i *)

(*@ function silly (x : integer) : integer *)
(*@ axiom really_silly : forall i. silly i = 42 *)

val equal : 'a t -> 'a t -> bool
(*@ b = equal t0 t1
    (** use the gospel predicate here *)
    ensures eq t0 t1 *)

(** Again some informal documentation about the module *)

exception TooMuch

(** adding an element in place *)
val add : 'a -> 'a t -> unit
(*@ add a t
    modifies t
    (* FIXME we should say something about the size and overflow *)
    ensures Seq.mem t.contents a *)
