open Core

module V0 :
sig
  exception UnsupportedType
  exception UpgradeToAMFV3
  type typed_object = {
    class_name : string;
    properties : (string * t) list;
  }
  and t =
    | Number of float
    | Boolean of bool
    | String of string
    | Object of (string * t) list
    | MovieClip
    | Null
    | Undefined
    | Reference of int
    | ECMAArray of (string * t) list
    | ObjectEnd
    | StrictArray of t array
    | Date of Time.t
    | LongString of string
    | Unsupported
    | RecordSet
    | XMLDocument of string
    | TypedObject of typed_object
    | AVMPlusObject
  val to_buffer : t -> string
  val of_buffer : string -> (t, Core_kernel.Error.t) result
end
