URL:  https://floating-shore-1680.herokuapp.com/

Admin Username: admin
Admin Password: admin


All the functionalities in the rubric have been implemented including the extra credits.

An Admin has the following privileges:
1. Edit/Delete Existing Users
2. Create/Edit/Delete other admins, except the superadmin.
3. Create/Edit/Delete Books
   An admin can delete a book only when it is currently available with the library.
   he/She cannot delete a book that has already been checked out by someone.
4. Can Search for books based on book title/ ISBN/ author/ availability status.
5. Can view a list of all the books in the library.
5. Can view a list of all the users in the library.
5. Checkout an available book on behalf of another user
6. Return a book on behalf of the user who has checked out the particular book previously.
7. Can view the transaction history for an user.
8. Can view the checkout history for any book.
9. The admin can view a list of all suggested books, as suggested by different users.
    The admin can then edit the book details ( like title, ssn, description) & can approve/reject a suggestion. Upon approving the suggestion, the book becomes available
    for users for checking-out/ returning.

  
A user(library member) has the following privileges:
1. Sign up as a new member.
2. Edit his/her own profile details.
3. View his/her own transaction history.
4. Search for books based on book title/ ISBN/ author/ availability status.
5. Can view a list of all the books in the library.
6. Checkout an available Book.
7. Return a book previously checked out by himself/herself.
8. A user can suggest a new book. This then has to be approved( or rejected) by the admin, to become available( or unavailable) for users to checkout.
9. A user can subscribe for receiving notifications for any desired book that is currently checked out. When that book becomes available, all the users who have
   subscribed for receiving notifications will receive an alert stating that the book is available.


Program Flow:

Both admin & library member have a common login page. The preconfigured admin is admin/admin.
A new library member needs to signup as a user & only then can he login.

Upon login, the library member will be shown the following options :
    - Edit his/her profile

    - View the list of all books in the library. Upon clicking this, you will be given an option for searching the books based on title/ssn/description/availability etc.
            - When the list of books is displayed, each book will have an option of show.
            - On clicking show, the page will contain all the details for the selected book. In addition, The show page contains the functionality for checkout/return book,
              Subscribing for notifications etc. as described in teh following lines.
                - If the book is available with the library, the user can check out the book.
                - Only if the logged in user possesses the book, he/she can return it.
                - If the book has been checked out by another user & the logged in user tries to return it, an error page will be displayed.
                  In such a scenario, the user is given an option to notify him upon availiability of the book via - "Subscribe" button.

    - Suggest a new book, upon clicking this, fill a form stating the details of the book you are suggesting.

    - My Transaction history - helps view his/her own transaction history ( list of books that he/she has checked out/returned along with the timestamp)

For an admin:
    - Edit his/her own profile

    - Manage Books - Click this to view a list of all books in the library, Search book functionality & Adding a new book to the system.
                   - When the list of books is displayed, each book will have an option of edit( to edit book details) & show
                   - On clicking show, the page will contain all the details for the selected book, the admin can edit details/ delete the book/ See the history for the book/
                     and even return/ checkout on a user's behalf.
    - Manage Users - Click this to view a complete list of all the users in the lib system, Search user functionality & Adding a new admin to the system.

    - View Suggested books - Click this to view a list of all books suggested by other library members. He is free to edit the book details & approve/reject the suggestion.

