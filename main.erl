-module(main).
%Factorial
-export([factorial/1, encr/1, desencr/1, sum/1, option/1, start/0, startConst/0, count10/0 ,count/1, check/1, fahr/1, cels/1, month/1]).
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
        format("\t ==== Cases in Erlang ==== \n"),
        MyProgr = {nivel, "Junior"},
        format(option(MyProgr)),
        io:nl(),
        MyOtherProgr = {nivel, "Senior"},
        format(option(MyOtherProgr)),
        io:nl().

%Constants
-define(MAX, 1000).
-define(SUMA (X,Y), X+Y).
-define(TITULO,"====== CONSTANTS IN ERLANG ======").
   startConst()->
        io:format("~p~n",[?TITULO]),
        io:format("MAX = ~p~n",[?MAX]),
        X = 8.79,    
        Y = 4.32,
        io:format("X = ~p, Y = ~p ~n",[X,Y]),
        io:format("SUMA = ~p~n",[?SUMA(X,Y)]).
    
%% Funciones
count([32| Rest]) -> count(Rest) + 1;
count([_| Rest]) -> count(Rest);
count([]) -> 1.

count10(10) -> 10;
count10(N) ->
    io:write(N),
    io:fwrite("\n"),
    count10(N + 1).

count10() -> count10(1).

check(success) -> io:fwrite("success~n");
check({error, Message}) -> io:fwrite("error: ~s~n", [Message]).

% @doc De Celsius a Fahrenheit
-spec fahr(number()) -> number().
fahr(C) -> (C-32)/1.8.


%% @doc De Fahrenheit a Celsius
-spec cels(number()) -> number().
cels(F) -> (F*1.8)+32.

%Define functions

month(1) -> "January";
month(2) -> "February";
month(3) -> "March";
month(4) -> "April";
month(5) -> "May";
month(6) -> "June";
month(7) -> "July";
month(8) -> "August";
month(9) -> "September";
month(10) -> "October";
month(11) -> "November";
month(12) -> "December";
month(_) -> "Sin definir".