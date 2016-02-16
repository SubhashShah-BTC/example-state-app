1. Steps to create and initialize the database
- rake db:setup
- rake db:test:prepare

2. Steps to prepare the source code
- Unzip the zip file
- Navigate to the unzipped folder
- Start server using `rails s`

3. Any assumptions made and missing requirements that are not covered in the requirements
- The requirements are very abstract and inadequate.
- User creation is done using seeding the database.
- Error messages are the default provided by rails framework.
- Focus is more on the features than UI.
- The attributes for a property/house, user and address are assumed.
- Add/Edit/List properties
- Upload properties images
- Display location in google maps for property
- Search for properties by country. Countries are listed from available countries in property records.
- Every property has an address.
- There are 4 types of users: admin, agent, customer, guest.
- Agent/Customer can purchase properties if availble. They can't purchase properties added by their own.
- Admin can do everything except purchasing a property.
- Admin can generate reports and export reported data to PDF.
- The reports are: properties available for sale, properties avaialble for rent, properties sold in current year, properties rented in current year.
- Agent/Customer can create properties and edit properties created by them.
- Guest can only view the property and location on the map.
- Every feature is accessible to the user by cancancan authorization. It is very important to look at ability.rb

4. Any feedback you may wish to give about improving the assignment
- Requirements have to be more specific and precise.