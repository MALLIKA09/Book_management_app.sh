#! /bin/bash
add_book()
{
  read -p "enter book name to add: " newbook
  books[$i]=$newbook
  let i++
  echo "new book added"
}
delete_book()
{
  read -p "enter book name to delete: " delete_this_book
  availablity=no
  for index in ${!books[@]}
  do
    if [ ${books[$index]} = $delete_this_book ]; then
      availability=yes
      unset books[$index]
      echo " $delete_this_book is now deleted"
      break
    fi
  done
  if [ $availability = no ];then
  echo "inserted book does not exist"
  fi
}
list_book()
{
  if [ ${#books[@]} -eq 0 ]; then
     echo "no books to list"
     return 1 
  fi
  echo "listing is below"
  echo "------"
  for book in ${books[@]}
  do
    echo $book
  done
}
echo

echo "welcome to my BOOK MANAGEMENT APP"
echo "----------------------------------"
declare -a books
i=0
while [ true ]
do
   read -p "enter your choice to add|delete|list|quit: " choice
   case $choice in
     add)
        add_book
        ;;
     delete)
        delete_book
        ;;
     list)
        list_book
        ;;
     quit)
        echo "thanks for using our app"
        break
        ;;
     *)
        echo "choose correct choice"
    esac
done
        
        
   

