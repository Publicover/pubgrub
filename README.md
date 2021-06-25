# pubgrub

This is a meal-planning app. Users enter ingredients and recipes, marking them as either sides or meals, then the app will pick seven dinners randomly and display them to the user. With each set of new meals for the week, a grocery list is generated. This list is clickable, so it saves the state of each item depending on whether you bought it, allowing users to buy groceries at different grocery stores if they need to. 

The back end uses devise for authentication, pundit for user roles and AWS for file storage. The front end is bootstrap that relies pretty heavily on ajax for different displays, particularly the grocery list. 
