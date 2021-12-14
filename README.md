README file

# Project Title:
Oystercard Challenge

# Motivation: 
Attempt to complete the week challenge with various peers from my cohort with the aim to further reinforce learning outcomes from week1. 
- This will cover TDD process, redlight - greenlight
- Refractoring.

# Installation:
- RVM: ruby-3.0.0
- bundler
- rspec 

# Notable sources & references
https://ruby-doc.org/

# Build status:
Start
README / USERSTORIES.md
Testing stage

# Challenge 3 - Stack trace / debugging:

Write down the type of error in the issue comments:
 - NameError: unintialized constant Oystercard
  
Write down the file path where the error happened:
 - ./spec/oystercard_spec.rb:3:in `<top (required)>'

Write down the line number of the error:
 - rb:3

Use the Ruby Documentation to find out what the error means
 - Spec infers controller by the describe param when / is found, then searches it in code paths, throws “NameError: uninitialized constant” if it is not found. 

# User story 1:
In order to use public transport
As a customer
I want money on my card

____________________
noun     |   verb
---------|----------
customer | want
card     | use 
public t.| 
money    | 

card ---> .balance ---> top_up = topped_up card.

