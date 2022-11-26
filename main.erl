-module(main).
%Factorial
-export([factorial/1, encr/1, desencr/1, sum/1, option/1, start/0]).
-import(io,[format/2]).
-import(io,[format/1]).
-import(io,[format/3]).
   factorial(N) ->
   	if
   		N == 0 -> 1;
   		N > 0 -> N*factorial(N-1)
   	end.
    
%Encrypt /  desencrypt
    encr(String) -> 
        list_to_atom([X+13 || X <- String]).

    desencr(String) ->
        list_to_atom([X-13 || X <- String]).

%Sum
    sum(N) ->
        if
            N == 1000 -> break;
            N < 1000 -> sum(N) + N
        end.    
% Cases
option(Programador)->
    case Programador of 
      {nivel, Junior} when Junior == "Junior" ->
         junior;
      {nivel, Senior} when Senior == "Senior" ->
         senior;
      {nivel, MidLevel} when MidLevel == "MidLevel" ->
         mid_level;
      {nivel, _} ->
         not_defined;
      _ ->
         unknown
    end.

    start()->
        format("\t ==== Casos en Erlang ==== \n"),
        MyProgr = {nivel, "Junior"},
        format(option(MyProgr)),
        io:nl(),
        MyOtherProgr = {nivel, "Senior"},
        format(option(MyOtherProgr)),
        io:nl().