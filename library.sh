#!/bin/bash

# Define the library directory
library_dir="library"

# Function to display available books
display_books(){
    echo "Available books:"
    for file in library/*
    do
        book_name=$(basename "$file" .txt)
        echo "$book_name"
    done
}

# Function to check out a book
checkout_book() {
  book_name="$1"
  if [ -f "library/$book_name.txt" ]; then
    mv "library/$book_name.txt" "checked_out/$book_name.txt"
    echo "You have checked out '$book_name'. Enjoy reading!"
  else
    echo "Sorry, '$book_name' is not available."
  fi
}


# Function to return a book
return_book() {
    local book=$1
    if [ -f "checked_out/$book.txt" ]; then
        mv "checked_out/$book.txt" "library/$book.txt"
        echo "Book '$book' has been returned."
    else
        echo "Book '$book' was not checked out."
    fi
}

# Main menu
while true; do
    echo "Welcome to the bourne again library"
    echo "1. Display available books"
    echo "2. Check out a book"
    echo "3. Return a book"
    echo "4. Exit"
    read -p "Please select an option: " choice

    case $choice in
        1)
            display_books
            ;;
        2)
            read -p "Enter the name of the book you want to check out: " book_name
            checkout_book "$book_name"
            ;;
        3)
            read -p "Enter the name of the book you want to return: " book_name
            return_book "$book_name"
            ;;
        4)
            echo "Thank you for using the Library!"
            exit
            ;;
        *)
            echo "Invalid option. Please choose again."
            ;;
    esac
done