# Restaurant Database

In this assignment you will draw an entity-relationship diagram to keep track of a family of restaurants and their customers, orders and employees and more.

### Your database will store information about a family of restaurants with the requirements outlined as follows:

- there are 4 different restaurants owned by the same company. Each restaurant has a unique name, a unique URL and an address.
- Restaurants have employees which are one of a\) management, b\) delivery, c\) chef, d\) server. All employees have a unique (among all restaurants) employee ID (an integer), a name and an email address. Each employee works at only one restaurant.
- Each week the employee's schedule is stored which consists of a list of days, start times and end times. No employee works two shifts on the same day of the week. Historical data for schedules is not stored, just the current week's schedule.
- Each restaurant has an online menu offering food items that customers may order (think Door Dash). Each food item is described by the name of the food ("fries") and a price (4.25). Of course each restaurant may sell the same items either at the same or a different price.
- customers are stored in the database using a unique identifier (their email address), a name (first name and last name), as well as a phone number and a delivery address. Customers are added to the database before they have placed any orders.
- All customers have an account which keeps track of payments made, the date on which the payment was made and the amount of credit that the customer has. The account does not store information about the orders that have been made, only payments.
- Customers place orders from the restaurants. Each order has a unique order ID (an integer). We keep track of the items that were ordered, the total amount (price) of the order, the tip that was given by the customer for the order, the order placement time and the order delivery time. We also keep track of who delivered the order to the customer.
- These restaurants are in a small town and so we want to keep track of the relationships between the restaurant employees and the customers, just because we can!
- chefs have different credentials such as those listed on this website.  For each chef we will store the various credentials that they have.

Show both the cardinality of the relationships (use the1:M notation on the lines) and the participation constraints. Do **NOT** include any extra information than is given above to illustrate the above database. For each entity, underline the key you would pick to be the primary key (if it is a weak entity, remember to use a dashed underline). If it will be a composite key, underline all attributes that will make up the composite key.

**You must use the notation shown in the class. Other notations will NOT be accepted nor marked**. Do NOT use UML-like notation. Entities should be shown as boxes, attributes as ovals etc. 

You may hand draw your diagrams as long as the image that you submit (a single image) can be clearly viewed. If you hand in multiple images or images that cannot be clearly read, your project will not be marked.

You might look into using draw.io or even powerpoint for doing your diagrams. 


# What to Submit
Submit the ER diagram in either .pdf or .jpg format.  You can screenshot if you wish or take a picture, but your submission MUST be legible.  

If you have made assumptions, include a list of assumptions along with your ER diagram.