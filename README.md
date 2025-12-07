# fpc-BNF
A parser generator for Backus-Naur form

## tl;dr
This is a parser generator that reads a programming language definition in Backus-Naur form, and generates a parser for the defined language, in Pascal. The implementation of the parser generator now uses FreePascal, keeping in mind that the resulting parser should be able to parse it's own (and also the generator's) source code.

## Why ?

I learn computer science, and my favorite topics are theory of computation and formal language theory. Also, being old a.f. makes me nostalgic about the good old days when programming in Pascal was the top of the world for me. 

My intention is to be able to make a parser and compiler for Pascal, finally to extend the recognized language to fit my own preference.

Maybe one day this will be my thesis, but first let's get it to be working.

## Programming style, disciplines
My vision is to have a programming language where you don't have to punish yourself with classes, visibility issues, dependency injection, design patterns and other clownfuckery of the traditional OOP stuff. 

The OOP discipline have ruined the whole industry, certain families of bugs can be distinguised that are coming from the fact that almost all software is done in some kind of object oriented manner. 

I believe that it can be done differently, and Pascal is a very nice candidate to finally make a variant of it, that has good sense of data closures, easily utilizing some kind of trait-like function assignment discipline, resulting in an easy to use language.

