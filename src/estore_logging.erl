-module(estore_logging).

-export([
  log_term/2
]).


log_term(Level,Term) ->
  log_term(Level,Term,logging_enabled(Level)).

log_term(Level,Term,true) ->
  io:fwrite(atom_to_list(Level) ++ ": ~p~n",[Term]);
log_term(_Level,_Term,_) ->
  ok.

logging_enabled(Level) ->
  Key = list_to_atom("log_" ++ atom_to_list(Level)),
  estore_utils:get_config(Key).
