#Function call 
import random 

#Title of the game
print("\tROCK PAPER SCISSORS GAME") 

#Takes user name as input
user_name= input("Enter Your Name: ") 

#Following escape sequences are used in the code: \n=New line \t=Horizontal tab
#Prints Welcome to user
print("\n\t\tWELCOME",user_name,"!") 
print("Winning Rules for the Game:\n \t *Rock vs Paper ---> Paper Wins \n \t *Rock vs Scissor ---> Rock Wins \n \t *Paper vs Scissors ---> Scissors Wins") #Print rules for the game.
print("\n\t\tSelect Option to their respective Numbers")

#Display options for game
print("Options are:\n\t\t1.Rock\n\t\t2.Paper\n\t\t3.Scissors") 

#Takes user's choice as input and store it in variable user_choice
user_choice=int(input("Enter your choice: ")) 
if user_choice >3 or user_choice <1 :

    #IF Condition checks if user gives input value less than 1 or greater than 3 then Error message will be shown following the user to enter option again
    user_choice=int(input("ERROR!!!\n\tEnter Valid Option Please: ")) 
if user_choice==1 :
    user= 'Rock'
elif user_choice==2 :
    user= 'Paper'
else :
    user= 'Scissors'

#Store user's choice in variable 'user'  by comparing input to respective options with use of Nested IF statement
#Display user's choice
print("You've chosen\t",user) 
print("Now it's computer's turn to choose!")

#Using python's random library function for getting computer's choice. randint function is used to get random integer value following by parenthesis which have the range of integers to be selected from.
comp_choice= random.randint(1,3) 
if comp_choice ==1 :
    comp= 'Rock'
elif comp_choice ==2 :
    comp= 'Paper'
else :
    comp= 'Scissors'
    
#Using Nested IF conditions to compare and store randomly slected value by computer to options provided
print("Computer has chosen\n\t",comp)

#Using Nested IF statements to compare and declare winner
if user == comp :
    print(user,"vs",comp,"\n\t\tIT IS A TIE!!!")
elif user_choice ==1 :
    if comp_choice == 2:
        print("\n\t\tCOMPUTER WINS!!!")
    if comp_choice == 3:
        print("\n\t\t",user_name,"WINS!!!")
elif user_choice ==2 :
    if comp_choice == 1:
        print("\n\t\t",user_name,"WINS!!!")
    if comp_choice == 3 :
        print("\n\t\t COMPUTER WINS!!!")
elif user_choice == 3 :
    if comp_choice == 1 :
        print("\n\t\t COMPUTER WINS!!!")
    if comp_choice == 2 :
        print("\n\t\t",user_name,"WINS!!!") 
print("Thanks For Playing :)" )


